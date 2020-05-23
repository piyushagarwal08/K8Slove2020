FROM httpd
MAINTAINER piyushagarwal.0108@gmail.com
COPY webapp1 /temp/webapp1
COPY webapp2 /temp/webapp2
COPY start.sh /temp/start.sh
RUN chmod +x /temp/start.sh
EXPOSE 80
ENV x=app
ENTRYPOINT ["/bin/bash","/temp/start.sh"]
