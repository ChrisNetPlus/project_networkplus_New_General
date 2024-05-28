tableextension 50800 "NP StockTaking Ext" extends "NP Stock Taking"
{
    fields
    {
        field(50700; "NP Shelf No."; Text[50])
        {
            Caption = 'Shelf No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Stockkeeping Unit"."Shelf No." where("Location Code" = field("Depot Number"), "Item No." = field("Item No.")));
        }
    }
}
