FROM php:7.4.19-alpine3.13
MAINTAINER RouRouX <itrourou@gmail.com>

ENV TZ Asia/Shanghai

WORKDIR /app

RUN set -eux \  
    && apk update \
    && apk add git \
    && git clone --depth 1 https://github.com/luolongfei/freenom.git /app \
    && apk add --no-cache tzdata bash

VOLUME ["/conf", "/app/logs"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["crond", "-f"]