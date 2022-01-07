#!/bin/bash

# script get the weather. meant to be used with polybar.
# uses https://www.weatherapi.com
# weather-icons https://erikflowers.github.io/weather-icons/

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

REPORT=$HOME/.weather
API_KEY=$(cat $HOME/.weather-api-key)
ZIPCODE=$(cat $HOME/.weather-zipcode)

# get the weather
curl -s -o $HOME/.weather "api.openweathermap.org/data/2.5/weather?zip=33418,us&units=imperial&appid=$API_KEY"

CURRENT_TEMP=$(printf "%.0f" $(cat $REPORT | jq -r .main.feels_like))
ICON=$(cat $REPORT | jq -r '.weather[0].icon')

DEGREE=\\u00B0

echo -e "$CURRENT_TEMP${DEGREE} %{F#458588}%{T7}$(get_icon "$ICON")%{F-}%{T0}${CONDITION} "
