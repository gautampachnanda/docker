FROM java:8
MAINTAINER Gautam Pachnanda <Gautam Pachnanda>
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get install wget
RUN apt-get install curl
RUN apt-get update && apt-get -y upgrade && apt-get install -y less && apt-get install -y curl && apt-get install -y xterm
RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN wget --no-check-certificate -O- https://download.elastic.co/logstash/logstash/logstash-1.5.1.tar.gz | tar xvfz -

ADD config/supervisord/logstash.conf /etc/supervisor/conf.d/
ADD config/logstash.conf  /logstash-1.5.1/logstash.conf

VOLUME ["/data", "/var/log", "/logs"]
EXPOSE 5000

# Start supervisor
CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf