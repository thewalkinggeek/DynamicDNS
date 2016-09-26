#!/bin/bash

# You MUST EDIT these settings - Do not remove quotes #
CURRENTIP="/tmp/whatever.log"                                 # Current IP log location (Logs current IP that is then compared to new IP )
UPDATEURL="https://myprovider.com/update.php?myupdatekey="    # Update URL provided by Dynamic DNS Service Provider (Get URL from Dynamic DNS Provider)
DNSLOG="/tmp/DynamicDnsProvider.log"                          # Dynamic DNS Log File (Logs IP Changes from Dyanmic DNS Provider)



# This is the site we are using to get our WAN IP Address # 
GETIPADDR="wget -qO- http://ipinfo.io/ip"

#DO NOT EDIT #
    if [ -f $CURRENTIP ]
    then
       if [ `cat $CURRENTIP` == `$GETIPADDR` ]
       then
           echo "No change in IP."
       else
           $GETIPADDR > $CURRENTIP
           wget --no-check-certificate -O - $UPDATEURL >> $DNSLOG 2>&1 &
        fi
    else
        $GETIPADDR >> $CURRENTIP 
    fi
