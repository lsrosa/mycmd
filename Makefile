all: base rcfiles

base:
	sudo apt install -y build-essential git vim cmake zsh curl


rcfiles:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s ~/repos/mycmd/.*rc ~/
	source ~/.zshrc

