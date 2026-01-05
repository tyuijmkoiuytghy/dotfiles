#!/bin/bash

VERSE=$(curl --request GET \
    --url 'https://beta.ourmanna.com/api/v1/get?format=text&order=daily' \
    --header 'accept: application/json')

sketchybar --set $NAME label="$VERSE"
