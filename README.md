# DynamicDNS
A Dynamic DNS IP Updater Script

INSTALL

1) Copy script to desired location.
2) Open updateip.sh in desired editor.
3) Edit log locations and Dynamic DNS Update URL

CURRENTIPLOG="/tmp/whatever.log"                                 
DNSLOG="/tmp/DynamicDnsProvider.log"
UPDATEURL="https://myprovider.com/update.php?myupdatekey="                            

4) Create a Chronjob to run the script. (user@myunixbox:~ $ crontab -e)
5) Add the line below to the end of your chron file. (This will run the script every hour)

0 */1 * * *  /location/of/updateip.sh 

6) Save
7) Manually run the script once to get current IP (user@myunixbox:~ $ /location/of/updateip.sh)
9) Enjoy!  The script will now check if the IP has changed every hour. If it has it will update and log the change.


