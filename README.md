# private-npm

Base Dockerfile for private NPM modules.

## Usage

Available on Docker Hub as [pavlov/private-npm](https://hub.docker.com/r/pavlov/private-npm).

```dockerfile
FROM pavlov/private-npm:latest
MAINTAINER Laika <laika@pavlovml.com>

RUN mkdir -p /opt/app
WORKDIR /opt/app

# config
ENV NPM_TOKEN 00000000-0000-0000-0000-000000000000

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

[BSD 3-Clause](https://github.com/pavlovml/private-npm/blob/master/LICENSE)
