FLUTTER_VERSION?=3.0.1
FLUTTER?=fvm flutter
REPOSITORIES?=lib/
RUN_VERSION?=--debug
RUN_DESKTOP?=macos
PLATEFORMS?=macos,linux, windows

GREEN_COLOR=\033[32m
NO_COLOR=\033[0m

define print_color_message
	@echo "$(GREEN_COLOR)$(1)$(NO_COLOR)";
endef

##
## ---------------------------------------------------------------
## Installation
## ---------------------------------------------------------------
##

.PHONY: install
install: ## Install environment
	@$(call print_color_message,"Install environment")
	fvm install $(FLUTTER_VERSION)
	fvm use $(FLUTTER_VERSION)
	$(FLUTTER) pub global activate devtools
	$(FLUTTER) pub global activate flutter_gen
	dart pub global activate lakos

.PHONY: enable-windows
enable-windows: ## enable windows
	@$(call print_color_message,"enable windows")
	$(FLUTTER) config --enable-windows-desktop

.PHONY: enable-macos
enable-macos: ## enable macos
	@$(call print_color_message,"enable macos")
	$(FLUTTER) config --enable-macos-desktop

.PHONY: enable-linux
enable-linux: ## enable linux
	@$(call print_color_message,"enable linux")
	$(FLUTTER) config --enable-linux-desktop

##
## ---------------------------------------------------------------
## Flutter
## ---------------------------------------------------------------
##

.PHONY: clean
clean: ## Clear cache
	@$(call print_color_message,"Clear cache")
	$(FLUTTER) clean

.PHONY: dependencies
dependencies: ## Update dependencies
	@$(call print_color_message,"Update dependencies")
	$(FLUTTER) pub get

.PHONY: format
format: ## Format code by default lib directory
	@$(call print_color_message,"Format code by default lib directory")
	$(FLUTTER) format $(REPOSITORIES)

.PHONY: analyze
analyze: ## Analyze Dart code of the project
	@$(call print_color_message,"Analyze Dart code of the project")
	$(FLUTTER) analyze .

.PHONY: format-analyze
format-analyze: format analyze ## Format & Analyze Dart code of the project

.PHONY: run
run: ## Run application by default debug version
	@$(call print_color_message,"Run application by default debug version")
	$(FLUTTER) run $(RUN_VERSION)

.PHONY: run-desktop
run-desktop: ## Run application on desktop by default on macos
	@$(call print_color_message,"Run application on desktop by default on macos")
	$(FLUTTER) run -d $(RUN_DESKTOP)

.PHONY: create
create: ## Add desktop support
	@$(call print_color_message,"Add desktop support")
	$(FLUTTER) create --platforms=$(PLATEFORMS) .

.PHONY: devtools
devtools: ## Serving DevTools
	@$(call print_color_message,"Serving DevTools")
	$(FLUTTER) pub global run devtools

.PHONY: show-dependencies
show-dependencies: ## Show dependencies tree
	@$(call print_color_message,"Show dependencies tree")
	$(FLUTTER) pub deps

.PHONY: outdated
outdated: ## Check the version of packages
	@$(call print_color_message,"Check the version of packages")
	$(FLUTTER) pub outdated --color

.PHONY: build-desktop
build-desktop: ## Build application on desktop by default on macos
	@$(call print_color_message,"Build application on desktop by default on macos")
	$(FLUTTER) build $(RUN_DESKTOP) $(RUN_VERSION)

##
## ---------------------------------------------------------------
## Generator
## ---------------------------------------------------------------
##

.PHONY: generate-assets
generate-assets: ## Generate assets with flutter_gen
	@$(call print_color_message,"Generate assets with flutter_gen")
	fluttergen

.PHONY: generate-files
generate-files: ## Generate files with build_runner
	@$(call print_color_message,"Generate files with build_runner")
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

.PHONY: generate-splash-screens
generate-splash-screens: ## Generate splash screens with flutter_native_splash
	@$(call print_color_message,"Generate splash screens with flutter_native_splash")
	$(FLUTTER) pub run flutter_native_splash:create

.PHONY: generate-dependency-graph
generate-dependency-graph: ## Generate dependency graph with lakos
	@$(call print_color_message,"Generate dependency graph with lakos")
	lakos . | dot -Tpng -Gdpi=200 -o dependency_graph.png

.PHONY: generate-launcher-icon
generate-launcher-icon: ## Generate the launcher icon
	@$(call print_color_message,"Generate the launcher icon")
	$(FLUTTER) pub run flutter_launcher_icons:main

##
## ---------------------------------------------------------------
## scrcpy
## ---------------------------------------------------------------
##

.PHONY: mirror
mirror: ## Mirror screen with scrcpy
	@$(call print_color_message,"Mirror screen with scrcpy")
	scrcpy --max-size 1024 --window-title 'My device'

.PHONY: record
record: ## Record screen with scrcpy
	@$(call print_color_message,"Record screen with scrcpy")
	scrcpy --max-size 1024 --no-display --record "flutter_$(shell date +%Y%m%d-%H%M%S).mp4"

#
# ----------------------------------------------------------------
# Help
# ----------------------------------------------------------------
#

.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(GREEN_COLOR)%-30s$(NO_COLOR) %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
