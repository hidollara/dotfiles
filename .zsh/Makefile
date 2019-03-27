ZDOTDIR := ${HOME}/.zsh

deploy:
	zsh -ci "zplug update; zplug clean --force"

init: clean
	{ echo export ZDOTDIR=${ZDOTDIR}; echo 'source $$ZDOTDIR/.zshenv'; } > ~/.zshenv
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| ZPLUG_HOME=${ZDOTDIR}/zplug zsh;

clean:
	rm -rf $$ZDOTDIR/zplug

