# unifi_wifi

 A bash script to enable, disable or check the status of a UniFi WiFi network.
 ## Requirements:
 
 * jq
 * curl
 
 ## User Config:
 
 * unifi_username: The username for your controller
 * unifi_password: The password for the user. Leave inside the single quotes.
 * unifi_controller: The URL where you access your controller
 * wifi_id: The ID of the WiFi you'd like to control. Details for acquiring the id below.
 * site_id: The ID of the site you would like to use. Details for acquiring the id below 
 * cookie: Path to the cookie for curl. Make sure the user that runs this script has permissions to this directory/file.
 *  
 ## Details:
 
 * This script is run like the following where parameter can be one of the following (enable | disable | status):
   `./unifi_wifi.sh parameter`
 
 ## Getting your wifi_id:
 
 * Navigate to your controller and sign in.
 * Navigate to Settings > Wifi Networks.
 * Click Edit next to the SSID you'd like to control.
 * Copy the ID from the end of the URL.
 * In the following example, the ID is ( 000d00c0e0b0e00d00000000 ):
   `https://example:8443/manage/site/default/settings/wlans/00bd00a6e0000e9da2cde10c/edit/000d00c0e0b0e00d00000000`
   
 ## Getting your site_id
 * only useful if you have set up another site instead of default 
 * from dashboard 
 * In the following example, the ID is ( 0hyhw73b ):' https://example.io/manage/0hyhw73b/settings/wifi '
 * default is default 


 ## Use:
 
 * Create a new file on your machine. I named mine unifi_wifi.sh.
 * Copy the below contents into your file.
 * Save the file.
 * chmod +x unifi_wifi.sh (Insert your file name there).
 * Use like `./unifi_wifi.sh parameter`



## Scope

* 99% of this is collated from elsewhere
* thanks to https://github.com/jcconnell https://github.com/ioull
* I made this purely to add in site_id and to make the check_status clearer 

