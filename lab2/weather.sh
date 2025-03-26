#!/bin/bash

DESTINATION="/var/www/html/index.nginx-debian.html"

echo "<HTML><BODY>" > $DESTINATION
curl wttr.in/Perm?format=j1 | jq '.["current_condition"][0] | .temp_C,.humidity' >> $DESTINATION
date >> $DESTINATION
echo "</BODY></HTML>" >> $DESTINATION
