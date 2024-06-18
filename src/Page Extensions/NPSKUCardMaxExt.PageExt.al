pageextension 50818 "NP SKUCardMaxExt" extends "Stockkeeping Unit Card"
{
    layout
    {
        addafter("Item No.")
        {
            field("NP Max. Order Qty Allowed"; Rec."NP Max. Order Qty Allowed")
            {
                ApplicationArea = All;
                ToolTip = 'Max. Order Qty Allowed';
                DecimalPlaces = 0 : 2;
            }
        }
    }
}
