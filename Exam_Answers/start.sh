#!/bin/bash
if [ "$x" == "app1" ]
then
	cp -rf /opt/webapp1/* /var/www/html/
	httpd -DFOREGROUND
elif [ "$x" == "app2" ]
then
	cp -rf /tmp/webapp2/* /var/www/html/
	httpd -DFOREGROUND
else
	echo "Incorrect Environment Variable" > /var/www/html/index.html
	httpd -DFOREGROUND
fi

