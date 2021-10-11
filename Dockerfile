FROM python:3.8-alpine AS build-image

RUN apk add --no-cache                                              \
        bash postgresql-client libpq jpeg-dev zlib-dev musl-dev     \
        make autoconf libtool postgresql-dev build-base g++ gcc     \
        unixodbc-dev freetds-dev libffi-dev czmq-dev libxml2-dev    \
        libxslt-dev automake cmake git openssl-dev cargo            \
        ffmpeg libwebp-dev libwebp

RUN /usr/local/bin/pip install poetry

