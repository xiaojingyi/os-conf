#!/bin/bash
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/* /etc/yum.repos.d/bak
cp yumrepo/*163* /etc/yum.repos.d/

# system depends
# common tool
yum install axel vim vim-X11
# yum accelerator
#yum install yum-plugin-fastestmirror.noarch
#yum install yum-axelget 
# compiles
yum install gcc make autoconf automake gcc-c++ gcc-gfortran.x86_64 git cmake qt5-qtbase-devel kernel-headers kernel-devel ctags blitz blitz-devel libjpeg-devel libtiff-devel giflib-devel netpbm-devel
# python
yum install python-matplotlib.x86_64 python-scikit-learn python-scikit-image boost-python python-tools python-pip python-flask.noarch python-tornado.x86_64 python-scikit-image.x86_64 numpy scipy.x86_64 Cython.x86_64 gtk2-devel.x86_64 MySQL-python
# php & mysql
yum install mysql-community-release-fc21-6.noarch.rpm
#yum install mariadb-server # if thereis no mysqldb
yum install php-mysqlnd mysql-server php-devel httpd php httpd-devel
# system config
yum install system-config-services.noarch iptables-services w3m nmap subversion
# caffe depends
yum install qt5-qtsvg-devel.x86_64 atlas-devel atlas-static gtatool-matlab.x86_64 protobuf-devel leveldb-devel snappy-devel boost-devel hdf5-devel gflags-devel glog-devel lmdb-devel blas protobuf-c.x86_64 feh openblas-devel protobuf-python.x86_64
# caffe

# python depends
pip install h5py
pip install elasticsearch
pip install pandas
pip install bob.extension
pip install bob.blitz
pip install bob.core
pip install bob.io.base
pip install bob.io.image

# mpich3
cd mpich*
./configure --prefix=/usr/local --enable-threads=multiple
make -j7
make install
cd ..

# opencv
cd opencv-2.4.10
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j7
make install
ln -s /usr/local/lib/python2*/site-packages/* /usr/lib/python2*/site-packages/
cd ../..
cp opencv-haar-classifier-training*/src/mergevec.cpp opencv-2.4.10/apps/haartraining/
cd opencv-2.4.10/apps/haartraining/
g++  -I/usr/local/include/opencv2/ -I/usr/local/include/opencv  -I. -o mergevec mergevec.cpp  cvboost.cpp cvcommon.cpp cvsamples.cpp cvhaarclassifier.cpp  cvhaartraining.cpp  cvsamplesoutput.cpp -lopencv_core -lopencv_calib3d -lopencv_imgproc -lopencv_highgui -lopencv_objdetect -L /usr/local/lib/
ln -s /datas/pkgs/opencv-2.4.10/apps/haartraining/mergevec /usr/local/bin/
cd ../../..

# openbr
cd openbr
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j7
make install
cd ../..

# build & install caffe
cd caffe-master
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/ -DCMAKE_BUILD_TYPE=Release -DAtlas_CBLAS_LIBRARY=/usr/lib64/atlas/libsatlas.so -DAtlas_LAPACK_LIBRARY=/usr/lib64/atlas/libatlas.a ..
make -j7
make install
cd ../..

cd caffe-parallel-master
make -j7
cd ..

#make install
#ln -s /usr/local/python/* /usr/lib/python2*/site-packages/
#cd ..

# $Id: $


