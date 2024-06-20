pageextension 50819 "NP UserSetItemExt" extends "User Setup"
{
    layout
    {
        addafter("Admin User")
        {
            field("NP Allow Item Card Edit"; Rec."Allow Item Card Edit")
            {
                ToolTip = 'Allow user to edit an item card';
                ApplicationArea = All;
            }
        }
    }
}
