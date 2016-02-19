# alpine-node

Base Dockerfile for NPM modules.

## Usage

Available on Docker Hub as [pavlov/alpine-node](https://hub.docker.com/r/pavlov/alpine-node).

```dockerfile
FROM pavlov/alpine-node:latest
MAINTAINER Laika <laika@pavlovml.com>

RUN mkdir -p /opt/app
WORKDIR /opt/app

# install
COPY . ./
RUN npm install

# cleanup (necessary, unfortunately)
RUN apk del make gcc g++ python && \
    rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.npmrc /root/.node-gyp

# run
EXPOSE 3000
CMD npm start
```

## Development

    $ make

## License

[BSD 3-Clause](https://github.com/pavlovml/alpine-node/blob/master/LICENSE)
