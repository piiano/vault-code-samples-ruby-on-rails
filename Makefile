PVAULT_DOCKER_NAME	:= pvault-dev

PVAULT_DOCKER_TAG	?= piiano/pvault-dev:1.0.2

APP_DIR						:= ./rails
SDK_DIR						:= ./pvault-sdk
SDK_GENERATOR_DIR	:= ./pvault-sdk-generator

###### PVAULT ######
.PHONY: pvault-run
pvault-run: pvault-stop
	docker run -d -it \
			   -e PVAULT_LOG_DATADOG_ENABLE=false \
			   -e PVAULT_SENTRY_ENABLE=false \
			   -e PVAULT_SERVICE_LICENSE=$(PVAULT_SERVICE_LICENSE) \
			   -e PVAULT_DEVMODE=1 \
			   -p 8123:8123 \
			   -p 5432:5432 \
			   --name $(PVAULT_DOCKER_NAME) \
			   $(PVAULT_DOCKER_TAG)
	# Give Vault a few seconds to start
	sleep 3
	# Add a users collection with email property to be used for tokenization.
	docker exec -i pvault-dev pvault collection add --collection-pvschema " \
		users PERSONS ( 	\
			name STRING NULL, \
			email STRING NULL, \
			ssn SSN NULL, \
		)"


.PHONY: pvault-stop
pvault-stop:
	docker rm -f $(PVAULT_DOCKER_NAME)

###### APP ######
.PHONY: prepare-sdk
prepare-sdk: generate-sdk

.PHONY: prepare-app
prepare-app: $(APP_DIR)/Gemfile.lock $(APP_DIR)/migrate

$(APP_DIR)/Gemfile.lock:
	cd $(APP_DIR) && bundle

$(APP_DIR)/migrate:
	cd $(APP_DIR) && bundle exec rails db:reset

.PHONY: prepare
prepare: prepare-app

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

$(SDK_DIR)/pvault-sdk.gemspec: $(OPENAPI_YAML)
	cd $(SDK_GENERATOR_DIR) && ./bin/generate.sh

.PHONY: generate-sdk
generate-sdk: $(SDK_DIR)/pvault-sdk.gemspec
