FROM gliderlabs/alpine:latest
MAINTAINER Alex Kern <alex@pavlovml.com>

RUN apk add --update make gcc g++ python nodejs
COPY npmrc /root/.npmrc
