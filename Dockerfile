FROM python:3.10.5-alpine AS build-image

RUN apk update                                                          \
 && apk add --no-cache                                                  \
        bash postgresql-client libpq jpeg-dev zlib-dev musl-dev         \
        make autoconf libtool postgresql-dev build-base g++ gcc         \
        unixodbc-dev freetds-dev libffi libffi-dev czmq-dev libxml2-dev \
        libxslt-dev automake cmake git openssl-dev ffmpeg libwebp-dev   \
        cargo

RUN /usr/local/bin/pip install poetry

FROM python:3.10.5-alpine AS deploy-image
RUN apk add --no-cache                                                  \
        bash postgresql-client libpq jpeg-dev zlib-dev musl-dev         \
        make autoconf libtool postgresql-dev build-base g++ gcc         \
        unixodbc-dev freetds-dev libffi libffi-dev czmq-dev libxml2-dev \
        libxslt-dev automake cmake git openssl-dev ffmpeg libwebp-dev   \
        cargo

COPY --from=build-image /usr/local/bin/poetry /usr/local/bin/poetry
COPY --from=build-image /usr/local/lib/python3.10 /usr/local/lib/python3.10
