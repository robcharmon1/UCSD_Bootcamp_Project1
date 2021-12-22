#!/bin/bash
grep 02:00:00 0310_Dealer_schedule | grep PM | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_Working_During_Losses
cat Dealers_Working_During_Losses
