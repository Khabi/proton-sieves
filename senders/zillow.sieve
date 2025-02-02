require ["include", "environment", "variables", "relational", "vnd.proton.expire"];

# Zillow Alerts, only keep for 7 days
if address :matches :domain "from" ["mail.zillow.com"]
{
    expire "day" "7";
}
