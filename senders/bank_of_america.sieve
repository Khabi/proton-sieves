require ["include", "environment", "variables", "relational","fileinto", "vnd.proton.expire"];

if address :matches :domain "from" ["ealerts.bankofamerica.com"]
{

    # Default location for all Bank of America emails
    fileinto "Finance";

    # Transaction alerts
    # 30 day retention
    if header :contains "subject" ["Account Alert: Debit Card Used Online, by Phone or by Mail", "Bank of America Alert: Debit Card Transaction outside the 50 states"]
    {
        expire "day" "30";
        stop;
    }

    # Balance alerts
    # 3 day retention
    if header :contains "subject" ["Your Available Balance"]
    {
        expire "day" "3";
        stop;
    }

    # Direct deposit alerts
    # 14 day retention
    if header :contains "subject" ["Receipt: Direct Deposit Received"]
    {
        expire "day" "14";
        stop;
    }

    # Retain anything else for 1 year.
    expire "day" "365";
}
