#!/bin/bash
sed -i "s/localhost:9200/es:9200/g" /kibana-4.1.1-linux-x64/config/kibana.yml
if [ "$KIBANA_SECURE" = "true" ] ; then
	ln -s /etc/nginx/sites-available/kibana-secure /etc/nginx/sites-enabled/kibana
	htpasswd -bc /etc/kibana/htpasswd ${KIBANA_USER} ${KIBANA_PASSWORD}
else
	ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/kibana
fi
sed -i "s/kibana:5601/$HOSTNAME:5601/g" /etc/nginx/sites-enabled/kibana
/usr/bin/supervisord -c /etc/supervisor/conf.d/kibana.conf