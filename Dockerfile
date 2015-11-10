FROM y.i.hybrisserver
MAINTAINER Mateus Prado<mateus@mateusprado.com>

ADD hybrisServer/hybrisServer-*.zip /tmp/

RUN for z in /tmp/hybrisServer-*.zip; do unzip $z -d ${PLATFORM_PACKAGE};done && rm -Rf /tmp/hybrisServer-*.zip
