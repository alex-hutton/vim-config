install:
	ln --force --symbolic $(shell pwd)/vimrc ~/.vimrc
	ln --force --symbolic $(shell pwd)/ ~/.vim
	git submodule update --init
