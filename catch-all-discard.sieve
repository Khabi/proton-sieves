# Block emails sent to specific addresses.
# Useful for spam mail and catchall addresses.
#
# usage: "<localuser>" is the useranme before the "@". You can seperate multiple addresses
#        commas.
require ["fileinto", "reject", "include", "environment", "relational", "comparator-i;ascii-numeric", "spamtest"];

if anyof (address :localpart :comparator "i;unicode-casemap" :is "To" ["<localuser>"])
{
  discard;
}


# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}
