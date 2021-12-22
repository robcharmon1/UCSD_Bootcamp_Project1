#!/bin/bash
grep -i "$1 $2" $3_Dealer_schedule | awk -F" " '{print $5, $6}'
