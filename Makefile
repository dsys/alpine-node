.PHONY: build run push

build:
	docker build -t pavlov/alpine-node .

run: build
	docker run -it pavlov/alpine-node sh

push:
	docker push pavlov/alpine-node
