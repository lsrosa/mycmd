all: base links writting 

base:
	sudo apt install -y build-essential git neovim cmake zsh curl build-essential
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
	sudo update-alternatives --config python
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

links:
	ln -fs ~/repos/mycmd/.*rc ~/
	source ~/.zshrc
	ln -fs ~/repos/mycmd/init.vim ~/.config/nvim/

python-base:
	sudo apt install -y python3-venv python3-pip
	python -m pip install --upgrade pip

vim: python-base
	if [ -f  ~/.vim/autoload/plug.vim ]; then \
		echo "plug.vim exists"; \
	else \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi
	if [ -d ~/repos/misc/vim-pydocstring ]; then \
		echo "vim-pydocstring exists"; \
	else \
		git clone git@github.com:heavenshell/vim-pydocstring.git ~/repos/misc/vim-pydocstring; \
	fi
	make -C ~/repos/misc/vim-pydocstring
	if [ -d ~/repos/misc/nerdtree ]; then \
		echo "nerdtree exists"; \
	else \
		git clone https://github.com/preservim/nerdtree.git ~/repos/misc/nerdtree; \
	fi

writting:
	sudo apt install -y texlive-full
	sudo apt install -y texstudio
	echo texstudio --version
