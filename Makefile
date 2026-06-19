# Get sha based on head commit
GIT_COMMIT := $(shell git rev-parse --short HEAD)

SERVICE_NAME = airflow
NAMESPACE    = caixa-de-vidro
REGISTRY     = ghcr.io
IMAGE        = $(REGISTRY)/$(NAMESPACE)/$(SERVICE_NAME)
TAG          = sha-$(GIT_COMMIT)


GHCR_USER  ?= $(USER)
GHCR_TOKEN ?= 

.PHONY: build push login run

build:
	docker build . -f docker/Dockerfile --tag $(IMAGE):$(TAG)
	@echo "built $(IMAGE):$(TAG)"

login:
	@test -n "$(GHCR_TOKEN)" || (echo "GHCR_TOKEN não setado" && exit 1)
	@echo "$(GHCR_TOKEN)" | docker login $(REGISTRY) -u $(GHCR_USER) --password-stdin

run: login
	docker run --rm -p 8081:8080 $(IMAGE):$(TAG) standalone

push: login
	docker push $(IMAGE):$(TAG)
