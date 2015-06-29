FROM java:8
MAINTAINER Gautam Pachnanda <Gautam Pachnanda>
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get install wget
RUN apt-get install curl
RUN apt-get update && apt-get -y upgrade && apt-get install -y less && apt-get install -y curl && apt-get install -y xterm
RUN wget --no-check-certificate -O- https://download.elastic.co/kibana/kibana/kibana-4.1.0-linux-x64.tar.gz | tar xvfz -
RUN apt-get -y install wget nginx-full apache2-utils supervisor
WORKDIR /opt
RUN mkdir /etc/kibana # This is where the htpasswd file is placed by the run script
ADD /config/kibana.yml /kibana-4.1.0-linux-x64/config/kibana.yml
ADD /config/sites-enabled/kibana /etc/nginx/sites-available/kibana
ADD /config/sites-enabled/kibana-secure /etc/nginx/sites-available/kibana-secure
ADD config/config.js /usr/share/kibana/config.js
RUN rm /etc/nginx/sites-enabled/*
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


ENV KIBANA_SECURE false
ENV KIBANA_USER kibana
ENV KIBANA_PASSWORD kibana

EXPOSE 80

ADD config/supervisord.conf /etc/supervisor/conf.d/kibana.conf

ADD run.sh ./run
RUN chmod +x ./run
CMD ./run