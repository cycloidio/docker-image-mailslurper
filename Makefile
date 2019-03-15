
VERSION := "1.14.1"

.PHONY: help
help: ## Show this help
	@echo "Use one of the following targets"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/:.*##/:##/' | column -t -s '##'

.PHONY: build
build: ## Build the docker image
	@docker build --build-arg MSP_VER=$(VERSION) -t cycloid/mailslurper:$(VERSION) .


.PHONY: push
push: ## Push the docker image to Docker Hub
	@docker push cycloid/mailslurper:$(VERSION)
