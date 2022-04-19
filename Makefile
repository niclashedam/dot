BREW_URL := https://raw.githubusercontent.com/homebrew/install/master/install

dotfiles = $(subst dots/, ~/, $(shell git ls-files dots))

atom_files = $(subst atom/, ~/.atom/, $(shell git ls-files atom))
atom_packages = $(subst \n, , $(shell cat Atomfile))

.PHONY: default

default: ~

/usr/local/bin/brew:
	curl -fsSL ${BREW_URL} | ruby
	brew update

~/.%: dots/.%
	mkdir -p $(dir $@)
	cp ${PWD}/$< $@

~/.atom/packages:
	rm -rf ~/.atom/packages/*
	apm install ${atom_packages}

~/.atom/%: atom/%
	mkdir -p $(dir $@)
	cp ${PWD}/$< $@

~: ${dotfiles} ${atom_files}
