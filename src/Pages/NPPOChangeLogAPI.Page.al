page 50850 "NP PO Change Log API"
{
    APIGroup = 'npsAPI';
    APIPublisher = 'networkPlus';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'poChangeLogAPI';
    DelayedInsert = true;
    EntityName = 'POchangeLog';
    EntitySetName = 'POchangeLogs';
    PageType = API;
    SourceTable = "Change Log Entry";
    SourceTableView = where("Table No." = filter(39), Exported = filter(false), "Primary Key Field 2 Value" = filter('PO*'));
    Permissions = tabledata "Change Log Entry" = RIMD;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(dateAndTime; Rec."Date and Time")
                {
                    Caption = 'Date and Time';
                }
                field(purchaseOrderNo; Rec."Primary Key Field 2 Value")
                {
                    Caption = 'PO Number';
                }
                field("fieldCaption"; Rec."Field Caption")
                {
                    Caption = 'Field Caption';
                }
                field(typeOfChange; Rec."Type of Change")
                {
                    Caption = 'Type of Change';
                }
                field("userID"; Rec."User ID")
                {
                    Caption = 'User ID';
                }
                field(oldValue; Rec."Old Value")
                {
                    Caption = 'Old Value';
                }
                field(newValue; Rec."New Value")
                {
                    Caption = 'New Value';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.Exported := true;
        Rec.Modify(false);
        Commit();
    end;
}
