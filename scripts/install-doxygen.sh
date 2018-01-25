#!/bin/sh
set -ex
wget -q http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.14.linux.bin.tar.gz

echo "Decompressing..."
tar -xzvf doxygen-1.8.14.linux.bin.tar.gz

echo "Configure and Install Doxygen"
cd doxygen-1.8.14 && ./configure && make install
