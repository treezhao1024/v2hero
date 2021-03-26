FROM alpine:latest
LABEL maintainer="https://github.com/onplus"

#ENV VER=v4.20.0

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2raybin \
 && cd /v2raybin \
 && wget  https://github.com/v2fly/v2ray-core/releases/download/v4.36.2/v2ray-linux-64.zip \
 && unzip v2ray-linux-64.zip \
 && chmod +x /v2raybin/v2ray \
 && rm -rf v2ray-linux-64.zip \
 && chgrp -R 0 /v2raybin \
 && chmod -R g+rwX /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
