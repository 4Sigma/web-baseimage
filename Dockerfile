FROM python:3.10.2-alpine AS build-image

RUN apk add --no-cache                                              \
         gcc musl-dev libffi-dev cargo openssl-dev


RUN /usr/local/bin/pip install poetry

FROM python:3.10-alpine AS deploy-image

COPY --from=build-image /usr/local/bin/poetry /usr/local/bin/poetry
COPY --from=build-image /usr/local/lib/python3.10 /usr/local/lib/python3.10
