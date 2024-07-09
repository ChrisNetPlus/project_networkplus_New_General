permissionset 50800 "NP NewGeneralPerms"
{
    Assignable = true;
    Permissions = codeunit "NP EventSubscribers" = X,
        page "NP PO Change Log API" = X;
}