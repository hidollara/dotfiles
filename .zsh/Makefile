ZDOTDIR := ${HOME}/.zsh

.DEFAULT_GOAL := help
.PHONY: help

prepare: clean ## Prepare the environment
	{ echo export ZDOTDIR=${ZDOTDIR}; echo 'source $$ZDOTDIR/.zshenv'; } > ~/.zshenv
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh;

update: ## Update plugins managed to zplug
	zsh -ci "zplug update; zplug clean --force"

clean: ## Remove files this created
	rm -rf $$ZDOTDIR/zplug

help: ## Show all the targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

