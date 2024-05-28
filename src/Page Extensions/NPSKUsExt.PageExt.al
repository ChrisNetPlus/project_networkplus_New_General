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
        }
    }
}
