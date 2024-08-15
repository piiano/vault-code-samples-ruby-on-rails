PVAULT_DOCKER_NAME	:= pvault-dev
PVAULT_DOCKER_TAG	?= piiano/pvault-dev:1.12.2

APP_DIR						:= ./rails
SDK_DIR						:= ./pvault-sdk
SDK_GENERATOR_DIR	:= ./pvault-sdk-generator

# Detect OS - Some commands on Linux and Mac are different.
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
        TIMEOUT := gtimeout
        SOURCE := source
endif
ifeq ($(UNAME_S),Linux)
        TIMEOUT := timeout
        SOURCE := .
endif

ifeq ($(UNAME_S),Darwin)
        TIMEOUT := gtimeout
        SOURCE := source
endif
ifeq ($(UNAME_S),Linux)
        TIMEOUT := timeout
        SOURCE := .
endif

###### PVAULT ######
.PHONY: pvault-run
pvault-run: pvault-stop
	docker run -d -it \
			-e PVAULT_LOG_DATADOG_ENABLE=false \
			-e PVAULT_SENTRY_ENABLE=false \
			-e PVAULT_SERVICE_LICENSE=${PVAULT_SERVICE_LICENSE} \
			-e PVAULT_DEVMODE=1 \
			-p 8123:8123 \
			-p 5432:5432 \
			--name $(PVAULT_DOCKER_NAME) \
			$(PVAULT_DOCKER_TAG)

	# Give Vault a few seconds to start
	$(TIMEOUT) 30 bash -c 'until curl -s --fail http://localhost:8123/api/pvlt/1.0/data/info/health; do sleep 1; done'

	# Check if Vault is running. Display logs otherwise.
	if [ "$$( docker container inspect -f '{{.State.Status}}' $(PVAULT_DOCKER_NAME) )" = "running" ]; then \
		docker exec -i pvault-dev pvault collection add --collection-pvschema " \
			users PERSONS ( \
			name STRING NULL, \
			email STRING NULL, \
			ssn SSN NULL, \
		)"; \
	else \
		docker logs $(PVAULT_DOCKER_NAME); \
		exit 1; \
	fi

.PHONY: pvault-stop
pvault-stop:
	docker rm -f $(PVAULT_DOCKER_NAME)

###### APP ######
.PHONY: prepare-sdk
prepare-sdk: generate-sdk

.PHONY: prepare-app
prepare-app: $(APP_DIR)/.bundle $(APP_DIR)/public/assets $(APP_DIR)/migrate

$(APP_DIR)/.bundle:
	cd $(APP_DIR) && bundle

$(APP_DIR)/public/assets:
	cd $(APP_DIR) && bundle exec rails assets:precompile

$(APP_DIR)/migrate:
	cd $(APP_DIR) && bundle exec rails db:reset

.PHONY: prepare
prepare: prepare-sdk prepare-app

.PHONY: stop-prereq
stop-prereq: pvault-stop

.PHONY: app-run
app-run: prepare pvault-run
	cd $(APP_DIR) && bin/dev

.PHONY: app-test
app-test: prepare stop-prereq pvault-run
	cd $(APP_DIR) && bundle exec rails test

###### SDK RUBY ######
IN_DOCKER_PWD	:= /local
OPENAPI_YAML	:= $(SDK_GENERATOR_DIR)/openapi.yaml
OPENAPI_URL     := https://docs.piiano.com/assets/openapi.yaml

$(OPENAPI_YAML):
	rm -f $(SDK_GENERATOR_DIR)/$(OPENAPI_YAML)
	curl -o ./pvault-sdk-generator/openapi.yaml $(OPENAPI_URL)

$(SDK_DIR)/pvault-sdk.gemspec: $(OPENAPI_YAML)
	-rm -rf $(SDK_DIR)/out
	cd $(SDK_GENERATOR_DIR) && ./bin/generate.sh

.PHONY: generate-sdk
generate-sdk: $(SDK_DIR)/pvault-sdk.gemspec

.PHONY: clean
clean:
	rm -rf $(SDK_DIR)
	rm -f ./pvault-sdk-generator/openapi.yaml
	rm -rf $(APP_DIR)/node_modules