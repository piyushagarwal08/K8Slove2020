FROM nginx
MAINTAINER piyushagarwal.0108@gmail.com
RUN apt-get update
RUN apt install python3 python3-pip -y
COPY CopyPodFile.sh /opt/CopyPodFile.sh
COPY ShowPods.py /opt/ShowPods.py
WORKDIR /opt
RUN chmod +x ShowPods.py
ENTRYPOINT /opt/getpods.sh