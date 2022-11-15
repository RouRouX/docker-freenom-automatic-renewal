FROM php:7.4.19-alpine3.13
MAINTAINER RouRouX <itrourou@gmail.com>
LABEL version="v0.5.1"

ENV TZ Asia/Shanghai

WORKDIR /app

RUN set -eux \  
    && apk update \
    && apk add git \
    && git clone --depth 1 https://github.com/luolongfei/freenom.git /app \
    && chmod +x /app/docker-entrypoint.sh \
    && apk add --no-cache tzdata bash

VOLUME ["/conf", "/app/logs"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["crond", "-f"]