FROM httpd
MAINTAINER piyushagarwal.0108@gmail.com
COPY webapp1 /temp/webapp1
COPY webapp2 /temp/webapp2
COPY start.sh ./
WORKDIR ./
RUN chmod +x start.sh
EXPOSE 80
ENV x=app
ENTRYPOINT ["/bin/bash","-c","./start.sh"]
