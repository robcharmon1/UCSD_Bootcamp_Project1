#!/bin/bash
# Script to find employee working at given date/time
# Run script with 5 arguments: time(xx:xx:xx) am/pm date(mmdd) ("3 4" for blackjack, "5 6" for roulette, "7 8" for texas hold 'em
x="$4"
y="$5"
grep -i "$1 $2" $3_Dealer_schedule | awk -F" " -v f="$x" -v l="$y" '{print $f, $l}'
