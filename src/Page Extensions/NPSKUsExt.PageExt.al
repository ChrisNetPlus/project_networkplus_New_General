pageextension 50803 "NP SKUsExt" extends "Stockkeeping Unit List"
{
    layout
    {
        addafter(Description)
        {
            field("NP Shelf No."; Rec."Shelf No.")
            {
                Caption = 'Shelf No.';
                ToolTip = 'Shelf No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("NP Max. Order Qty Allowed"; Rec."NP Max. Order Qty Allowed")
            {
                Caption = 'Max. Order Qty Allowed';
                ToolTip = 'Max. Order Qty Allowed';
                ApplicationArea = All;
                DecimalPlaces = 0 : 2;
            }
        }
    }
}
