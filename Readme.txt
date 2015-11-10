
  Hybris Server Image y.i.platformserver
  ===============================

  This image is based on the hybrisserver image and should generally just add
  hybrisServer-*.zip which have been generated via ANT PRODUCTION.

  build as: make build

  run first node:
   docker run \
    -d \
    -e y_tomcat_http_port=8080 -e y_tomcat_ssl_port=8443 \
    -e CATALINA_JAVA_OPTS="-Xms1500m -Xmx1500m -ea -Dcom.sun.management.jmxremote \
       -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
       -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false" \
    -e TOMCAT_SERVER_XML="server_proxy_nossl.xml" \
    -e TC_HTTP_PROXY_PORT=8080 \
    -e TC_HTTP_REDIRECT_PORT=8443 \
    -e TC_HTTPS_PROXY_PORT=8443 \
    -v /opt/hybris/acc_medias:/etc/hybris/data/media \
    --env-file acc_env \
    --link y.s.solr:solr \
    --link y.s.solr:localhost \
    --link y.s.mysql:mysql \
    --name y.s.acc_1 \
    mateusprado/y.i.accelerator:store

  run second node:
   docker run \
    -d \
    -e y_tomcat_http_port=8080 -e y_tomcat_ssl_port=8443 \
    -e CATALINA_JAVA_OPTS="-Xms1500m -Xmx1500m -ea -Dcom.sun.management.jmxremote \
       -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
       -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false" \
    -e TOMCAT_SERVER_XML="server_proxy_nossl.xml" \
    -e TC_HTTP_PROXY_PORT=8080 \
    -e TC_HTTP_REDIRECT_PORT=8443 \
    -e TC_HTTPS_PROXY_PORT=8443 \
    -v /opt/hybris/acc_medias:/etc/hybris/data/media \
    --env-file acc_env \
    --link y.s.solr:solr \
    --link y.s.solr:localhost \
    --link y.s.mysql:mysql \
    --name y.s.acc_2 \
    mateusprado/y.i.accelerator:store
