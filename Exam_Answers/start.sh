#!/bin/bash
if [ $x = "app1" ]
then
	cp /tmp/webapp1 /var/www/html/
elif [ $x = "app2" ]
then
	cp /tmp/webapp2 /var/www/html/
else
	echo "Incorrect Environment Variable" > /var/www/html/index.html
fi

