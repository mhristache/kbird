FROM alpine:edge

LABEL maintainer="Maximilian Hristache <mhristache@gmail.com>"

RUN apk --no-cache --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add bird && \
    rm -rf /var/lib/apt/lists/*

COPY target/release/kbird /usr/sbin/kbird

ENTRYPOINT ["/usr/sbin/kbird"]
