all: base rcfiles vim writting cor_tud

base:
	sudo apt install -y build-essential git vim cmake zsh curl
	sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s ~/repos/mycmd/.*rc ~/
	source ~/.zshrc

python-base:
	sudo apt install -y python3.10-venv python3-pip
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

writting:
	sudo apt install -y texlive-full
	sudo add-apt-repository ppa:sunderme/texstudio
	sudo apt remove texstudio-doc texstudio-l10n
	sudo apt update
	sudo apt install -y texstudio
	echo texstudio --version

kuka_fri_home = ~/repos/kuka/kuka_fri
sva_home = ~/repos/kuka/SpaceVecAlg
rbd_home = ~/repos/kuka/RBDyn
mc_home = ~/repos/kuka/mc_rbdyn_urdf
corrade_home = ~/repos/kuka/corrade
rc_home = ~/repos/kuka/robot_controllers
cor_tud:
	# kuka_fri
	if [ -d $(kuka_fri_home) ]; then \
		echo "kuka_fri exists"; \
	else \
		git clone git@gitlab.tudelft.nl:kuka-iiwa-7-cor-lab/kuka_fri.git $(kuka_fri_home) -b legacy; \
	fi
	$(kuka_fri_home)/waf -t $(kuka_fri_home) configure
	$(kuka_fri_home)/waf -t $(kuka_fri_home)
	sudo $(kuka_fri_home)/waf -t $(kuka_fri_home) install
	# space vec alg
	sudo apt install libeigen3-dev libboost1.74-all-dev
	if [ -d $(sva_home) ]; then \
		echo "SpaceVecAlg exists"; \
	else \
		git clone git@github.com:costashatz/SpaceVecAlg.git $(sva_home); \
	fi
	cmake -B$(sva_home)/build -H$(sva_home) -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF
	make -j$(shell nproc) -C $(sva_home)/build
	sudo make -C $(sva_home)/build install
	# RBDyn
	if [ -d $(rbd_home) ]; then \
		echo "RBDyn exists"; \
	else \
		git clone  git@github.com:costashatz/RBDyn.git $(rbd_home); \
	fi
	cmake -B$(rbd_home)/build -H$(rbd_home) -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF	
	make -j$(shell nproc) -C $(rbd_home)/build
	sudo make -C $(rbd_home)/build install
	# mc_rdbyn_urdf
	sudo apt install libtinyxml2-dev
	if [ -d ~/repos/kuka/mc_rbdyn_urdf ]; then \
		echo "mc_rbdyn_urdf exists"; \
	else \
		git clone --recursive git@github.com:costashatz/mc_rbdyn_urdf.git ~/repos/kuka/mc_rbdyn_urdf; \
	fi
	cmake -B$(mc_home)/build -H$(mc_home) -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF	
	make -j$(shell nproc) -C $(mc_home)/build
	sudo make -C $(mc_home)/build install
	#corrade
	if [ -d $(corrade_home) ]; then \
		echo "corrade exists"; \
	else \
		git clone git@github.com:mosra/corrade.git $(corrade_home); \
		git -C $(corrade_home) checkout 0d149ee9f26a6e35c30b1b44f281b272397842f5; \
	fi
	cmake -B$(corrade_home)/build -H$(corrade_home)
	make -j$(shell nproc) -C $(corrade_home)/build
	sudo make -C $(corrade_home)/build install
	#robot controllers
	if [ -d $(rc_home) ]; then \
		echo "robot_controllers exists"; \
	else \
		git clone git@github.com:epfl-lasa/robot_controllers.git $(rc_home); \
	fi
	cmake -B$(rc_home)/build -H$(rc_home)
	make -j$(shell nproc) -C $(corrade_home)/build
	sudo make -C $(rc_home)/build install
	#cor tud iiwa ros
	if [ -d ~/repos/kuka/iiwa_ros ]; then \
		echo "iiwa_ros exists"; \
	else \
		git clone git@gitlab.tudelft.nl:kuka-iiwa-7-cor-lab/iiwa_ros.git ~/repos/kuka/iiwa_ros; \
	fi
