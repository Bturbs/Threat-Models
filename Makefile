# Makefile for Threat Modeling Data

.PHONY: init test check-yaml site build-corda-solana-toolkit

BASE_MODEL_DIR ?= threatModels
MKDOC_ASSET_DIR ?= security_site/mkdocs
BUILD_DIR ?= build
SITE_NAME ?= R3 Threat Models
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

generate-corda-solana-toolkit-html:
	npm run generate:corda-solana-toolkit

generate-corda-solana-toolkit-html-no-diagrams:
	npm run generate:corda-solana-toolkit -- --skipDiagrams

generate-CordaProtocolV1-html:
	npm run generate:corda-protocolV1

generate-CordaProtocolV1-pdf:
	npm run generate:corda-protocolV1 -- --generatePDF --pdfHeaderNote "Property of R3 Private and confidential"

jira-CordaProtocolV1-csv:
	npx threat-model-jira \
		--rootTMYaml threatModels/CordaProtocolV1/CordaProtocolV1.yaml \
		--dest SEC --csv build/CordaProtocolV1/Jira.csv \
		--epic PROT-303 \
		--linkPrefix https://security.r3.com/CordaProtocolV1/index.html

jira-CordaProtocolV1-dryrun:
	npx threat-model-jira \
		--rootTMYaml threatModels/CordaProtocolV1/CordaProtocolV1.yaml \
		--dest SEC --dryRun

jira-CordaProtocolV1-list:
	npx threat-model-jira \
		--rootTMYaml threatModels/CordaProtocolV1/CordaProtocolV1.yaml \
		--dest SEC --list
