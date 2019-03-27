DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help
.PHONY: help

list: ## Show dotfiles in this repository
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

prepare: ## Prepare the environment
	@$(foreach val, $(wildcard ./prep/*.sh), DOTPATH=${DOTPATH} bash $(val);)

deploy: ## Create symlinks to your home directory
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update: ## Fetch changes for this repository
	git pull origin master

clean: ## Remove files this created
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

help: ## Show all the targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

