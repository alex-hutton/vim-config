DEBIAN_DEPENDENCIES = vim

install:
	DEBIAN_FRONTEND=noninteractive sudo -E apt-get -y install $(DEBIAN_DEPENDENCIES)
	ln --force --symbolic $(shell pwd)/vimrc ~/.vimrc
	ln --force --symbolic $(shell pwd) ~/.vim
	git submodule update --init
