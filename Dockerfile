FROM mhart/alpine-node:5.1.1
MAINTAINER Alex Kern <alex@pavlovml.com>

RUN apk add --update make gcc g++ python
COPY npmrc /root/.npmrc
