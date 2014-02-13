install:
	ln -s $(shell pwd)/vimrc ../.vimrc
	git submodule update --init
