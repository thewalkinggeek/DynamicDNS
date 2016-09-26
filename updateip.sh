#!/bin/bash

# You MUST EDIT these settings - Do not remove quotes #
CURRENTIPLOG="/tmp/whatever.log"                                 # Current IP log location (Logs current IP that is then compared to new IP )
DNSLOG="/tmp/DynamicDnsProvider.log"                          # Dynamic DNS Log File (Logs IP Changes from Dyanmic DNS Provider)
UPDATEURL="https://myprovider.com/update.php?myupdatekey="    # Update URL provided by Dynamic DNS Service Provider (Get URL from Dynamic DNS Provider)




# This is the site we are using to get our WAN IP Address # 
GETIPADDR="wget -qO- http://ipinfo.io/ip"

#DO NOT EDIT #
    if [ -f $CURRENTIPLOG ]
    then
       if [ `cat $CURRENTIPLOG` == `$GETIPADDR` ]
       then
           echo "No change in IP."
       else
           $GETIPADDR > $CURRENTIPLOG
           wget --no-check-certificate -O - $UPDATEURL >> $DNSLOG 2>&1 &
        fi
    else
        $GETIPADDR >> $CURRENTIPLOG 
    fi
