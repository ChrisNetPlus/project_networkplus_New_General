pageextension 50804 "NP Adjust Inventory Ext" extends "Adjust Inventory"
{
    layout
    {
        addafter(QtyToAdjust)
        {
            field("NP ShelfNo"; ShelfNo)
            {
                Caption = 'Shelf No.';
                ToolTip = 'Shelf No.';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        SKU: Record "Stockkeeping Unit";
    begin
        Clear(ShelfNo);
        SKU.Reset();
        SKU.SetRange("Location Code", Rec.Code);
        SKU.SetRange("Item No.", Item."No.");
        if SKU.FindFirst() then
            ShelfNo := SKU."Shelf No."
        else
            ShelfNo := '';
    end;

    var
        ShelfNo: Text;
}
