FROM alpine:edge

MAINTAINER Maximilian Hristache <mhristache@gmail.com>

RUN apk --no-cache --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add bird && \
    rm -rf /var/lib/apt/lists/* 

