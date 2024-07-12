codeunit 50800 "NP EventSubscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateQuantity', '', false, false)]
    local procedure CheckMaxQty(var PurchaseLine: Record "Purchase Line")
    var
        SKU: Record "Stockkeeping Unit";
        Item: Record Item;
        CheckText: Text;
    begin
        Clear(CheckText);
        if PurchaseLine.Type <> PurchaseLine.Type::Item then
            exit;
        Item.Get(PurchaseLine."No.");
        if Item.Type <> Item.Type::Inventory then
            exit;
        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::Quote then begin
            CheckText := CheckPOInventory(PurchaseLine);
            if CheckText <> '' then
                Error(CheckText);
        end;
        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::Order then begin
            CheckText := CheckPOInventory(PurchaseLine);
            if CheckText <> '' then
                Error(CheckText);
        end;
    end;

    local procedure CheckPOInventory(PurchaseLine: Record "Purchase Line"): Text
    var
        SKU: Record "Stockkeeping Unit";
        OpenLines: Decimal;
        ExitText: Text;
    begin
        Clear(OpenLines);
        SKU.Reset();
        SKU.SetRange("Item No.", PurchaseLine."No.");
        SKU.SetRange("Location Code", PurchaseLine."Location Code");
        SKU.SetFilter("NP Max. Order Qty Allowed", '<>%1', 0);
        if SKU.FindFirst() then begin
            SKU.CalcFields(Inventory);
            if SKU.Inventory >= SKU."NP Max. Order Qty Allowed" then
                exit('Enough Already in Stock');
            if SKU.Inventory < SKU."NP Max. Order Qty Allowed" then begin
                if PurchaseLine.Quantity > SKU."NP Max. Order Qty Allowed" then
                    exit('The Order Quantity is Greater than the Maximum Order Quantity for your location of ' + Format(SKU."NP Max. Order Qty Allowed"));
                if (PurchaseLine.Quantity + SKU.Inventory) > SKU."NP Max. Order Qty Allowed" then
                    exit('You Can Only Order up to ' + Format(SKU."NP Max. Order Qty Allowed" - SKU.Inventory));
                if (PurchaseLine.Quantity + SKU.Inventory) < SKU."NP Max. Order Qty Allowed" then begin
                    OpenLines := CheckOpenLines(PurchaseLine."No.", PurchaseLine."Location Code");
                    if (PurchaseLine.Quantity + SKU.Inventory + OpenLines) >= SKU."NP Max. Order Qty Allowed" then
                        exit('There are already sufficient in stock and on order for your location')
                    else
                        exit('')
                end;
            end;
        end;
    end;

    local procedure CheckOpenLines(ItemNo: Code[20]; LocationCode: Code[20]): Decimal
    var
        OrderedLines: Record "Purchase Line";
        ExitQty: Decimal;
    begin
        ExitQty := 0;
        OrderedLines.Reset();
        OrderedLines.SetRange(Type, OrderedLines.Type::Item);
        OrderedLines.SetRange("Document Type", OrderedLines."Document Type"::Order);
        OrderedLines.SetRange("No.", ItemNo);
        OrderedLines.SetRange("Location Code", LocationCode);
        OrderedLines.SetFilter("Outstanding Quantity", '<>%1', 0);
        OrderedLines.SetRange("NP Cancelled Order", false);
        if OrderedLines.FindSet() then
            repeat
                ExitQty := ExitQty + OrderedLines."Outstanding Quantity";
            until OrderedLines.Next() = 0;
        exit(ExitQty);
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeModifyEvent', '', false, false)]
    local procedure CheckEditPossible(var Rec: Record Item)
    var
        UserSetUp: Record "User Setup";
    begin
        UserSetUp.Reset();
        if UserSetUp.Get(UserId) then begin
            if UserSetUp."Allow Item Card Edit" = false then
                Error('You do not have permission to edit an item card');
        end;
    end;
}
