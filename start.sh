#!/bin/bash
if [ $x = "app1" ]
then
	git clone https://github.com/mdn/beginner-html-sit-styled
	httpd -DFOREGROUND
else
	git clone https://github.com/microsoft/project-html-website
	httpd -DFOREGROUND
fi
