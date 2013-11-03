#!/bin/bash
curl -s "http://weather.yahooapis.com/forecastrss?w=613858&u=c" -o /tmp/weather.xml
city=$(grep "yweather:location" /tmp/weather.xml | grep -o "city=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
country=$(grep "yweather:location" /tmp/weather.xml | grep -o "country=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
echo $city', '$country

temperature=$(grep "yweather:condition" /tmp/weather.xml | grep -o "temp=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
echo $temperature'°'

cp -f ~/.geektool/weather/$(grep "yweather:condition" /tmp/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"').png /tmp/weather.png
#file://localhost/tmp/weather.png -p 0,45 -s 60x60

condition=$(grep "yweather:condition" /tmp/weather.xml | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"' | tr '[a-z]' '[A-Z]')
echo $condition

cp -f ~/.geektool/weather/wind.png /tmp/wind.png
#file://localhost/tmp/wind.png -p 0,135 -s 15x15

speedWind=$(grep "yweather:wind" /tmp/weather.xml | grep -o "speed=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
speedUnits=$(grep "yweather:units" /tmp/weather.xml | grep -o "speed=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
echo $speedWind' '$speedUnits 

cp -f ~/.geektool/weather/humidity.png /tmp/humidity.png
#file://localhost/tmp/humidity.png -p 0,155 -s 15x15

humidity=$(grep "yweather:atmosphere" /tmp/weather.xml | grep -o "humidity=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"')
echo $humidity' %'

cp -f ~/.geektool/weather/$(grep "yweather:forecast" /tmp/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"' | awk 'NR==1').png /tmp/weather-today.png
#file://localhost/tmp/weather-today.png -p 0,185 -s 30x30

cp -f ~/.geektool/weather/$(grep "yweather:forecast" /tmp/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"' | awk 'NR==2').png /tmp/weather-tomorrow.png
#file://localhost/tmp/weather-tomorrow.png -p 130,185 -s 30x30

day1=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "day=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==1' | tr '[a-z]' '[A-Z]')
echo $day1

day2=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "day=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==2' | tr '[a-z]' '[A-Z]')
echo $day2

high1=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==1')
echo $high1'°'

low1=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==1')
echo $low1'°'

high2=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==2')
echo $high2'°'

low2=$(grep "yweather:forecast" /tmp/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | tr -d '"'| awk 'NR==2')
echo $low2'°'
