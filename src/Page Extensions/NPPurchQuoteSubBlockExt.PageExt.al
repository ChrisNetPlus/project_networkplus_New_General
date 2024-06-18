pageextension 50817 "NP PurchQuoteSubBlockExt" extends "Purchase Quote Subform"
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
