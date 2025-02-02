require ["include", "environment", "variables", "relational", "vnd.proton.expire"];

#  GreenSky Credit emails
if address :matches :domain "from" ["greenskycredit.com"]
{

    # Upcoming payments
    if header :contains "subject" ["Your Payment Due Date is Approaching"]
    {
        expire "day" "7";
        stop;
    }

    # Retain anything else for 30 days
    expire "day" "30";
}