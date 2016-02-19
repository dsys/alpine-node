FROM gliderlabs/alpine:latest
MAINTAINER Alex Kern <alex@pavlovml.com>

ARG NODE_VERSION=5.6.0
ARG NPM_VERSION=3

RUN apk add --no-cache git curl make gcc g++ binutils-gold python linux-headers paxctl libgcc libstdc++ && \
  curl -sSL https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz | tar -xz && \
  cd /node-v${NODE_VERSION} && \
  ./configure --prefix=/usr ${CONFIG_FLAGS} && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /usr/bin/node && \
  cd / && \
  npm install -g npm@${NPM_VERSION} && \
  find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
  apk del linux-headers paxctl && \
  rm -rf /etc/ssl /node-v${NODE_VERSION} \
    /usr/share/man /tmp/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

RUN npm set progress=false
