FROM gliderlabs/alpine:edge
MAINTAINER Alex Kern <alex@pavlovml.com>

ENV NODE_VERSION 5.7.1
ENV NPM_VERSION 3

RUN apk add --no-cache curl make gcc g++ binutils-gold python linux-headers paxctl libgcc libstdc++ && \
  curl -o node-v${NODE_VERSION}.tar.gz -sSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz && \
  tar -zxf node-v${NODE_VERSION}.tar.gz && \
  cd /node-v${NODE_VERSION} && \
  ./configure --prefix=/usr && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /usr/bin/node && \
  cd / && \
  npm install -g npm@${NPM_VERSION} && \
  find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
  apk del curl make gcc g++ binutils-gold python linux-headers paxctl && \
  rm -rf /etc/ssl /node-v${NODE_VERSION}.tar.gz /node-v${NODE_VERSION} \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
