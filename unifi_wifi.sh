#!/bin/bash

unifi_username=USERNAME
unifi_password='PASSWORD'
unifi_controller=https://EXAMPLE.COM:8443
wifi_id=YOUR_WIFI_ID
site_id=default
cookie=/tmp/cookie

curl_cmd="curl -s -S --cookie ${cookie} --cookie-jar ${cookie} --insecure "

unifi_login() {
 # authenticate against unifi controller
 # Mute response by adding > /dev/null
 ${curl_cmd} -H "Content-Type: application/json" -X POST -d "{\"password\":\"$unifi_password\",\"username\":\"$unifi_username\"}" $unifi_controller/api/login > /dev/null
}

unifi_logout() {
 # logout
 ${curl_cmd} $unifi_controller/logout
}

enable_wifi() {
 # enables wifi network
 # Mute response by adding > /dev/null
 ${curl_cmd} "$unifi_controller"'/api/s/$site_id/rest/wlanconf/'"$wifi_id" -X PUT --data-binary '{"_id":"'"$site_id"'","enabled":true}' --compressed > /dev/null
}

disable_wifi() {
 # enables guest wifi network
 # Mute response by adding > /dev/null
 ${curl_cmd} "$unifi_controller"'/api/s/$site_id/rest/wlanconf/'"$wifi_id" -X PUT --data-binary '{"_id":"'"$site_id"'","enabled":false}' --compressed > /dev/null
}

check_status() {
 # checks wifi network status
 # Mute response by adding > /dev/null
 response=$(${curl_cmd} "$unifi_controller"'/api/s/$site_id/rest/wlanconf/'"$wifi_id" --compressed)
 status=$(echo $response | jq ".data[0].enabled")
 if [ "$status" == "true" ]; then
 exit 0
 elif [ "$status" == "false" ]; then
 exit 1
 else
 echo exit -1
 fi
}

unifi_login
if [ "$1" == "enable" ]; then
 echo "Enabling WiFi."
 enable_wifi
elif [ "$1" == "disable" ]; then
 echo "Disabling WiFi."
 disable_wifi
elif [ "$1" == "status" ]; then
 check_status
else
 echo "Must include command line parameter [enable|disable|status]."
fi
unifi_logout
