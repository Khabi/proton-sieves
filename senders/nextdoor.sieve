require ["include", "environment", "variables", "relational", "vnd.proton.expire"];

if address :matches :domain "from" ["nextdoor.com"]
{
    expire "day" "2";
}
