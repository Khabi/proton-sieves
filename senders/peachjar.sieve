require ["include", "environment", "variables", "relational", "vnd.proton.expire"];

# Peachjar emails are school fliers.
if address :matches :domain "from" ["peachjar.com"]
{

    # Filter school fliers out.
    if header :contains "subject" ["New School Flyer"]
    {
        expire "day" "1";
        stop;
    }

    # Retain anything else for 14 days
    expire "day" "14";
}
