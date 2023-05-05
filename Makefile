ENVIRONMENT=local
IMAGE_VERSION=0.0.0
GIT_COMMIT:=$(shell git rev-parse HEAD)

base:
	kubectl kustomize .kustomize/base | sed 's/ENVIRONMENT/$(ENVIRONMENT)/g' | sed 's/IMAGE_VERSION/$(IMAGE_VERSION)/' | sed 's/GIT_COMMIT/$(GIT_COMMIT)/'

dev:
	kubectl kustomize .kustomize/overlays/development | sed 's/ENVIRONMENT/$(ENVIRONMENT)/g' | sed 's/IMAGE_VERSION/$(IMAGE_VERSION)/' | sed 's/GIT_COMMIT/$(GIT_COMMIT)/'

staging:
	kubectl kustomize .kustomize/overlays/staging | sed 's/ENVIRONMENT/$(ENVIRONMENT)/g' | sed 's/IMAGE_VERSION/$(IMAGE_VERSION)/' | sed 's/GIT_COMMIT/$(GIT_COMMIT)/'

production:
	kubectl kustomize .kustomize/overlays/production | sed 's/ENVIRONMENT/$(ENVIRONMENT)/g' | sed 's/IMAGE_VERSION/$(IMAGE_VERSION)/' | sed 's/GIT_COMMIT/$(GIT_COMMIT)/'
