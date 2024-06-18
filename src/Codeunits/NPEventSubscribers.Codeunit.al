codeunit 50800 "NP EventSubscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateQuantity', '', false, false)]
    local procedure CheckMaxQty(var PurchaseLine: Record "Purchase Line")
    var
        SKU: Record "Stockkeeping Unit";
    begin
        if PurchaseLine.Type <> PurchaseLine.Type::Item then
            exit;
        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::Quote then begin
            SKU.Reset();
            SKU.SetRange("Location Code", PurchaseLine."Location Code");
            SKU.SetRange("Item No.", PurchaseLine."No.");
            SKU.SetFilter("NP Max. Order Qty Allowed", '<>%1', 0);
            if SKU.FindFirst() then begin
                if PurchaseLine.Quantity > SKU."NP Max. Order Qty Allowed" then
                    Error('You are not allowed to order more than ' + Format(SKU."NP Max. Order Qty Allowed"));
            end;
        end;
        if PurchaseLine."Document Type" = PurchaseLine."Document Type"::Order then begin
            SKU.Reset();
            SKU.SetRange("Location Code", PurchaseLine."Location Code");
            SKU.SetRange("Item No.", PurchaseLine."No.");
            SKU.SetFilter("NP Max. Order Qty Allowed", '<>%1', 0);
            if SKU.FindFirst() then begin
                if PurchaseLine.Quantity > SKU."NP Max. Order Qty Allowed" then
                    Error('You are not allowed to order more than ' + Format(SKU."NP Max. Order Qty Allowed"));
            end;
        end;
    end;
}
