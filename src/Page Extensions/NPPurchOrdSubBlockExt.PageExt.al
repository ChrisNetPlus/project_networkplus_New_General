pageextension 50816 "NP PurchOrdSubBlockExt" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("NP Item Blocked"; Rec."NP Item Blocked")
            {
                ApplicationArea = All;
                ToolTip = 'Item Blocked';
                Editable = false;
            }
        }
    }
}
