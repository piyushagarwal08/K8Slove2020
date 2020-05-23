#!/bin/bash
if [ $x = "app1" ]
then
	cp /tmp/webapp1 /usr/share/nginx/html/
	httpd -DFOREGROUND
elif [ $x = "app2" ]
then
	cp /tmp/webapp2 /usr/share/nginx/html
	httpd -DFOREGROUND
else
	echo "Incorrect Environment Variable" > /usr/share/nginx/html/index.html
	httpd -DFOREGROUND
fi

