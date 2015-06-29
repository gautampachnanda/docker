FROM java:8
MAINTAINER Gautam Pachnanda <Gautam Pachnanda>
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get install wget
RUN apt-get install curl
RUN apt-get install -y locate
RUN apt-get install less
RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
EXPOSE 8080 8000 8443
ADD example.yml /services/example.yml
ADD dropwizard-example-0.9.0-rc2-SNAPSHOT.jar /services/dropwizard-example-0.9.0-rc2-SNAPSHOT.jar
ADD example.keystore /services/example.keystore 
# Start supervisor
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf