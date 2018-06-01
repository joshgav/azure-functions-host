IMAGE_REGISTRY = joshgav
IMAGE_NAME = functions-runtime-go
IMAGE_VERSION ?= latest

build:
	docker build --file './Dockerfile' --tag '${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_VERSION}' .

publish: build
	docker push "${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_VERSION}"

.PHONY: build publish
