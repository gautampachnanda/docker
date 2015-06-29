FROM java:8
MAINTAINER Gautam Pachnanda <Gautam Pachnanda>
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get install wget
RUN apt-get install curl
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo "deb http://packages.elastic.co/elasticsearch/1.6/debian stable main" | sudo tee -a /etc/apt/sources.list
RUN sudo apt-get update && sudo apt-get install elasticsearch
RUN apt-get install -y locate
RUN apt-get install less
RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

EXPOSE 22 80 9200 9300
CMD ["/usr/bin/supervisord"]
