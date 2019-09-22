INSTANTCLIENT_VERSION ?= 18.3
CONTAINER_PREFIX = levonet/instantclient

all: publish

build:
	docker build --build-arg INSTANTCLIENT_VERSION=$(INSTANTCLIENT_VERSION) -t $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim -f node-slim/Dockerfile .
	docker build --build-arg INSTANTCLIENT_VERSION=$(INSTANTCLIENT_VERSION) -t $(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim -f python-slim/Dockerfile .

publish: build
	docker push $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim
	docker push $(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim

clean:
	docker rmi $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim \
		$(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim
