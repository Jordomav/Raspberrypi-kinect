#!/usr/bin/env bash
echo "-----Updating-----"
sudo apt-get update

echo "-----Installing needed build deps-----"
sudo apt-get install build-essential python-dev ipython python-opencv -y
sudo apt-get install python-numpy python-scipy -y

echo "-----Install Build Tools-----"
sudo apt-get install git-core git -y
sudo apt-get install freeglut3 freeglut3-dev libxmu-dev libxi-dev -y
sudo apt-get install cmake cmake-curses-gui pkg-config -y

echo "-----Installing Libusb-----"
sudo apt-get install libudev-dev -y

echo "-----Getting Libfreenect source-----"
sudo wget http://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.19/libusb-1.0.19.tar.bz2/download

echo "-----Untaring Libfreenect-----"
tar xvjf download

echo "-----Building Libfreenect-----"
cd libusb-1.0.19
./configure
make
sudo make install

echo "-----Installing the libfreenect library-----"
git clone https://github.com/OpenKinect/libfreenect.git
cd libfreenect
mkdir build
cd build
ccmake ..

echo "-----Config-----"

echo "-----Final build-----"
cmake ..
make
sudo make install

echo "-----Library installed setting up python libs for libfreenect-----"
cd ../wrappers/python
sudo python setup.py install

echo "-----Install complete-----"
echo "Run sudo python demo_cv_async.py to test"
