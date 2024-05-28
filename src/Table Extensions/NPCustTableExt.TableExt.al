tableextension 50811 "NP CustTableExt" extends Customer
{
    fields
    {
        field(50801; "NP Self Billing"; Boolean)
        {
            Caption = 'Self Billing';
            DataClassification = CustomerContent;
        }
    }
}
