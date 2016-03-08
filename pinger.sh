#! /bin/bash

WEBSITE=https://thehawken.org/fs/?s=0
SUBJECT="$Feral Server might be down!"
EMAILID="an@email.com"
STATUS=$(curl -sI $WEBSITE | awk '/HTTP\/1.1/ { print $2 }')
STRING=$(curl -s $WEBSITE | grep -o "string_to_search")
VALUE="enceladus
100%/?/?/?"

if [ "$STATUS" != 200 ] && [ "$STRING" != "$VALUE" ]; then
        echo "Website: $WEBSITE is down, status code: '$STATUS' - $(date)" | mail -s "$SUBJECT" $EMAILID
#
