noetic:
	sudo apt install -y lsb
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(shell lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
	sudo apt update
	sudo apt install -y ros-noetic-desktop-full

noetic_source:
	# check http://wiki.ros.org/Installation/Source
	sudo apt install -y lsb
	sudo apt-get update
	sudo apt install -y python3-rosdep2 python3-rosinstall-generator python3-vcstools 

rbt_home = ~/repos/kuka/rbt
robotics_toolbox:
	# swift
	if [ -d $(rbt_home)/swift ]; then \
		echo "swift exists"; \
	else \
		git clone https://github.com/jhavl/swift.git $(rbt_home)/swift; \
	fi
	pip install -e $(rbt_home)/swift
	# spatial geometry
	if [ -d $(rbt_home)/spatialgeometry ]; then \
		echo "spatial geometry exists"; \
	else \
		git clone https://github.com/jhavl/spatialgeometry.git $(rbt_home)/spatialgeometry; \
	fi
	pip install -e $(rbt_home)/spatialgeometry
	# spatial math
	if [ -d $(rbt_home)/spatialmath-python ]; then \
		echo "spatial math exists"; \
	else \
		git clone https://github.com/petercorke/spatialmath-python.git $(rbt_home)/spatialmath-python; \
	fi
	pip install -e $(rbt_home)/spatialmath-python
	# robotics toolbox
	if [ -d $(rbt_home)/roboticstoolbox-python ]; then \
		echo "robotics toolbox exists"; \
	else \
		git clone https://github.com/petercorke/robotics-toolbox-python.git $(rbt_home)/roboticstoolbox-python; \
	fi
	pip install -e $(rbt_home)/roboticstoolbox-python
	
cor_tud_deps:
	pip install qpsolvers
	sudo apt install ros-noetic-ros-controllers

kuka_fri_home = ~/repos/kuka/kuka_fri
sva_home = ~/repos/kuka/SpaceVecAlg
rbd_home = ~/repos/kuka/RBDyn
mc_home = ~/repos/kuka/mc_rbdyn_urdf
corrade_home = ~/repos/kuka/corrade
rc_home = ~/repos/kuka/robot_controllers

howto_home = ~/repos/how-to
howto:
	if [ -d $(howto_home) ]; then \
    	echo "How tos exists"; \
    else \
    	git clone git@gitlab.tudelft.nl:kuka-iiwa-7-cor-lab/how-to.git $(howto_home); \
    fi


cor_tud:cor_tud_deps howto
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
	sudo apt install libeigen3-dev libboost-all-dev
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
