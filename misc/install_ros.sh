export ROS_OS_OVERRIDE=osx:macports

mkdir homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew
export PATH=$PATH:$DENSE_ROOT/homebrew/bin/

export GROOVY_SRC=$DENSE_ROOT/groovy_underlay
export GROOVY_INSTALL=$DENSE_ROOT/groovy
wstool init -j8 $GROOVY_SRC http://packages.ros.org/web/rosinstall/generate/raw/groovy/ros_comm

ln -s $GROOVY_SRC/catkin/cmake/toplevel.cmake $GROOVY_SRC/CMakeLists.txt

mkdir $GROOVY_SRC/build
cd $GROOVY_SRC/build
cmake .. -DPYTHON_LIBRARY=$EPD/lib/libpython2.7.dylib  -DPYTHON_LIBRARIES=$EPD/lib/libpython2.7.dylib  -DCMAKE_INSTALL_PREFIX=$GROOVY_INSTALL -DSETUPTOOLS_DEB_LAYOUT=OFF
