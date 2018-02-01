#!/bin/sh
set -ex

# Build instructions from: https://www.stack.nl/~dimitri/doxygen/download.html
echo "Cloning doxygen repository..."
git clone https://github.com/doxygen/doxygen.git doxygen-src

cd doxygen-src

# Use v1.8.14 (2f4139de014bf03898320a45fe52c92872c1e0f4)
git checkout 2f4139de014bf03898320a45fe52c92872c1e0f4 .

echo "Create build folder..."
mkdir build
cd build

echo "Make..."
cmake -G "Unix Makefiles" ..
make

echo "Done building doxygen..."
./bin/doxygen -v

cd $TRAVIS_BUILD_DIR
