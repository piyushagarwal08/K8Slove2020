#!/bin/bash
count=1
while [ $count -le 10 ]
do
	./kubectl run adhoc$count --image=alpine --command -- ping 8.8.8.8
	((count++))
done
