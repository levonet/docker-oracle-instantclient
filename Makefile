INSTANTCLIENT_VERSION ?= 18.5
INSTANTCLIENT_BUILD ?= 1
CONTAINER_PREFIX = levonet/instantclient

all: publish

build:
	docker build \
		--compress \
		--build-arg INSTANTCLIENT_VERSION=$(INSTANTCLIENT_VERSION) \
		--build-arg INSTANTCLIENT_BUILD=$(INSTANTCLIENT_BUILD) \
		-t $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim \
		-f node-slim/Dockerfile .
	docker build \
		--compress \
		--build-arg INSTANTCLIENT_VERSION=$(INSTANTCLIENT_VERSION) \
		--build-arg INSTANTCLIENT_BUILD=$(INSTANTCLIENT_BUILD) \
		-t $(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim \
		-f python-slim/Dockerfile .

publish: build
	docker push $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim
	docker push $(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim

clean:
	docker rmi $(CONTAINER_PREFIX)-node:$(INSTANTCLIENT_VERSION)-10-slim \
		$(CONTAINER_PREFIX)-python:$(INSTANTCLIENT_VERSION)-2-slim
