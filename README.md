# DynamicDNS
A Dynamic DNS IP Updater Script

INSTALL

1) Copy script to desired location.
2) Open updateip.sh in desired editor.
3) Change log names and locations.

Line 2: CURRENTIP="/mydir/whatever.log"
Line 12: wget --no-check-certificate -O - YOUR_UPDATE_URL >> /mydir/dnsprovider.log 2>&1 &

4) Change Update URL provided by Dynamic DNS service.

Line 12:  wget --no-check-certificate -O - https://myprovider.com/update.php?myupdatekey=


5) Create a Chronjob to run the script. (user@myunixbox:~ $ crontab -e)
6) Add below line to the bottom of your chron file. (This will run the script every hour)

0 */1 * * *  /location/of/updateip.sh 

7) Save
8) Manually run the script once to get current IP (user@myunixbox:~ $ /location/of/updateip.sh)
9) Enjoy!  The script will now check if the IP has changed every hour. If it has it will update and log the change.


