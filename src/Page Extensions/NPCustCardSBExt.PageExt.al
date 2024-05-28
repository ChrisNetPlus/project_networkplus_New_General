pageextension 50815 "NP CustCardSBExt" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("NP Self Billing"; Rec."NP Self Billing")
            {
                ToolTip = 'Denotes if the customer is self-billing';
                ApplicationArea = All;
            }
        }
    }
}
