# alpine-node

Base Dockerfile for NPM modules.

## Usage

Available on Docker Hub as [pavlov/alpine-node](https://hub.docker.com/r/pavlov/alpine-node).

```dockerfile
FROM pavlov/alpine-node:latest
MAINTAINER Laika <laika@pavlovml.com>

# deps
RUN apk --update add gcc g++ python

# install
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY . ./
RUN npm install

# clean up
RUN apk del gcc g++ python && \
    rm -rf /tmp/* /var/cache/apk/* /root/.npm /root/.npmrc /root/.node-gyp

# run
EXPOSE 80
CMD [ "npm", "start" ]
```

## Development

    $ make

## License

[BSD 3-Clause](https://github.com/pavlovml/alpine-node/blob/master/LICENSE)
