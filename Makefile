SHELL = /bin/sh

DOCKER ?= $(shell which docker)
DOCKER_REPOSITORY := sdaoudi/node

PROXY_CONFIG=--build-arg HTTP_PROXY=$(HTTP_PROXY) --build-arg HTTPS_PROXY=$(HTTPS_PROXY) --build-arg NO_PROXY=$(NO_PROXY)

COM_COLOR   = \033[0;35m
OBJ_COLOR   = \033[0;36m
OK_COLOR    = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR  = \033[0;33m
NO_COLOR    = \033[m

NODE_VERSION?=10

BUILD_ARGS=--build-arg NODE_VERSION=$(NODE_VERSION)

TARGETS:=$(MAKEFILE_LIST)

# Phony targets
# #############
.PHONY: help
.DEFAULT_GOAL := help

# Rules
# ######

help: ## This is help. Adding "cmd=help" will give help of only the wanted command
	@for target in $(TARGETS); \
	do \
	  if [ ! -z "$(file)" ] && [ ! "$(file)" = "$$target" ]; then \
		 continue; \
	  fi; \
	  printf '\n$(OK_COLOR)%-40s $(NO_COLOR)\n' $$target | sed 's/ /=/2g'; \
	  grep -E '^[a-zA-Z_.-]+:.*?## .*$$' $$target | sort | \
	  awk -v cmd="$(cmd)" 'BEGIN {FS = ":[^:]*? ## "}; { \
		 if ((length(cmd) && cmd == $$1) || !length(cmd)) { \
			printf "$(OBJ_COLOR)%-20s$(NO_COLOR) %s\n", $$1, $$2; \
		 } \
		 if (length(cmd) && cmd == $$1) { \
			exit 0; \
		 } \
	  }'; \
	done

#####
all: ## Do the action to all node.js version (8 & 10)
	make build NODE_VERSION=8
	make push NODE_VERSION=8
	make build NODE_VERSION=10
	make push NODE_VERSION=10

#####
build: ## Build an individual image (NODE_VERSION)
	  ${DOCKER} build --no-cache ${PROXY_CONFIG} ${BUILD_ARGS} --tag ${DOCKER_REPOSITORY}:node-${NODE_VERSION}-alpine .

#####
deploy: push ## Deploy a specific version

#####
push: ## push a specific version (NODE_VERSION)
	${DOCKER} push ${DOCKER_REPOSITORY}:node-${NODE_VERSION}-alpine

#####
clean: ## Delete any images.
	${DOCKER} images --quiet sdaoudi/node | xargs ${DOCKER} rmi -f

