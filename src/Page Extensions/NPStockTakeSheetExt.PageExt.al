pageextension 50800 "NP StockTakeSheetExt" extends "NP Stock Taking Sheet"
{
    layout
    {
        addafter("Depot Name")
        {
            field("NP Shelf No."; Rec."NP Shelf No.")
            {
                Caption = 'Shelf No.';
                ToolTip = 'Shelf No.';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
