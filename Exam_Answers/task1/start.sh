#!/bin/bash
if [ "$x" == "app1" ]
then
	cp -rf /temp/webapp1/* /usr/local/apache2/htdocs/
	httpd -DFOREGROUND

elif [ "$x" == "app2" ]
then
	cp -rf /temp/webapp2/* /usr/local/apache2/htdocs/
	httpd -DFOREGROUND
else
	echo "Incorrect Environment Variable" > /usr/local/apache2/htdocs/index.html
	httpd -DFOREGROUND
fi

