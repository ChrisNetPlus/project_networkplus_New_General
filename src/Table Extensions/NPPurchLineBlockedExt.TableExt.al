tableextension 50813 "NP PurchLineBlockedExt" extends "Purchase Line"
{
    fields
    {
        field(50813; "NP Item Blocked"; Boolean)
        {
            Caption = 'Item Blocked';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Purchasing Blocked" where("No." = field("No.")));
        }
    }
}
