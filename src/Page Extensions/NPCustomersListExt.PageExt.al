pageextension 50802 "NP CustomersListExt" extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field("NP Payment Method Code"; Rec."Payment Method Code")
            {
                ToolTip = 'Payment Method Code';
                ApplicationArea = All;
            }
            field("NP Self Billing"; Rec."NP Self Billing")
            {
                ToolTip = 'Denotes if the customer is self-billing';
                ApplicationArea = All;
            }
        }
    }
}
