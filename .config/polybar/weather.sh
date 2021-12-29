#!/bin/bash

# script get the weather. meant to be used with polybar.
# uses https://www.weatherapi.com

## here we get new info if the last check was >= 1800 seconds ago
#LAST_REPORT=$(cat $HOME/.weather)
REPORT=$HOME/.weather
LAST_REPORT_EPOCH=$(cat $REPORT | jq -r .location.localtime_epoch)
NOW_EPOCH=$(date +%s)
API_KEY=$(cat $HOME/.weather-api-key)
ZIPCODE=$(cat $HOME/.weather-zipcode)

# arithmetic in bash is awesome
LAST_REPORT_SECONDS=$((NOW_EPOCH-LAST_REPORT_EPOCH))
#echo "it's been $LAST_REPORT_SECONDS seconds since the last api call"

if (( $LAST_REPORT_SECONDS > 1800 )); then
  curl -s -o $HOME/.weather "https://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$ZIPCODE&aqi=no"
fi

CURRENT_TEMP=$(cat $REPORT | jq -r .current.feelslike_f)
CONDITION=$(cat $REPORT | jq -r .current.condition.code)
CONDITION=\\u$CONDITION
DEGREE=\\u00B0

#printf "${CONDITION} $CURRENT_TEMP${DEGREE}f"
printf "$CURRENT_TEMP${DEGREE}f"
