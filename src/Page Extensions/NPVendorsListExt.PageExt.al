pageextension 50801 "NP VendorsListExt" extends "Vendor List"
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
        }
    }
}
