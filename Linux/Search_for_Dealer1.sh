#!/bin/bash
grep 05:00:00 0310_Dealer_schedule | grep AM | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_Working_During_Losses
cat Dealers_Working_During_Losses
