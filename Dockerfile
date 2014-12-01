
FROM c3h3/oblas-py278-data:u1404

RUN apt-get update && apt-get -y install python2.7-dev

RUN apt-get -y install libgtk2.0-dev libjpeg-dev libtiff4-dev libjasper-dev libopenexr-dev libtbb-dev libeigen3-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant libvtk5-qt4-dev

RUN cd /tmp && git clone https://github.com/Itseez/opencv.git
RUN cd /tmp/opencv && git checkout 2.4.9.1 && mkdir build
RUN cd /tmp/opencv/build && cmake -D WITH_TBB=ON  -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_OPENGL=ON -D WITH_VTK=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so -D PYTHON_EXECUTABLE=/root/.pyenv/versions/2.7.8/bin/python2.7 -D PYTHON_PACKAGES_PATH=/root/.pyenv/versions/2.7.8/lib/python2.7/site-packages -D PYTHON_INCLUDE_DIR=/root/.pyenv/versions/2.7.8/include/python2.7 -D PYTHON_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python2.7 -D PYTHON_NUMPY_INCLUDE_DIR=/root/.pyenv/versions/2.7.8/lib/python2.7/site-packages/numpy/core/include .. 

RUN cd /tmp/opencv/build && make && make install
RUN cd /tmp && rm -r opencv



