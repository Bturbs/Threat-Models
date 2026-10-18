# Makefile for Threat Modeling Data

.PHONY: init test check-yaml site

BASE_MODEL_DIR ?= threatModels
MKDOC_ASSET_DIR ?= security_site/mkdocs
BUILD_DIR ?= build
SITE_NAME ?= Threat Models
MKDOCS_DIR ?= $(BUILD_DIR)/mkdocs
MKDOCS_SITE_DIR ?= $(BUILD_DIR)/site-mkdocs
TM_CLI_DIR ?= tm-cli

init:
	npm install

test: check-yaml

build-mkdocs:
	cd $(TM_CLI_DIR) && ./node_modules/.bin/tsx node_modules/.bin/threat-model-mkdocs \
		--TMDirectory "../$(BASE_MODEL_DIR)" \
		--MKDocsDir "../$(MKDOCS_DIR)" \
		--MKDocsSiteDir "../$(MKDOCS_SITE_DIR)" \
		--templateSiteFolderSRC "../$(MKDOC_ASSET_DIR)" \
		--siteName "$(SITE_NAME)"

site:
	$(MAKE) build-mkdocs
