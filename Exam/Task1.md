# Create Dockerfile
vim adhochttpd.dockerfile
```sh
FROM centos
MAINTAINER piyushagarwal.0108@gmail.com
RUN yum install httpd -y
EXPOSE 80
ENV x=app
COPY start.sh ./var/www/html/start.sh
RUN chmod +x ./var/www/html/start.sh
ENTRYPOINT ./var/www/html/start.sh
```

# create start.sh
vim start.sh
```sh
#!/bin/bash
if [ $x = app1 ]
then
git clone https://github.com/mdn/beginner-html-site-styled.git
httpd -DFOREGROUND
else
git clone https://github.com/microsoft/project-html-website.git
httpd -DFOREGROUND
fi
```

# Build Docker file as 
```sh
docker build -t pykid/may2020q1:v1 -f adhochttpd.dockerfile .
```

# To upload on Docker hub
```sh
docker login
# enter the username and password
docker push pykid/may2020q1:v1
```
