#!/bin/bash
#
string="foo bar foo bar"
if curl -s "http://www.google.com" | grep -q "$string"; then
    echo "'$string' found"
else
    echo "'$string' not found"
fi
