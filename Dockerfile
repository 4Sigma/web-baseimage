FROM python:3.10.6-alpine3.16 AS build-image

RUN apk update                                                          \
 && apk add --no-cache                                                  \
        bash postgresql-client libpq jpeg-dev zlib-dev musl-dev         \
        make autoconf libtool postgresql-dev build-base g++ gcc         \
        unixodbc-dev freetds-dev libffi libffi-dev czmq-dev libxml2-dev \
        libxslt-dev automake cmake git openssl-dev ffmpeg libwebp-dev   \
        cargo poetry

CMD ["/bin/bash"]
