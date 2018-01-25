#!/bin/sh
set -ex
wget http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.14.linux.bin.tar.gz
tar -xzvf doxygen-1.8.14.linux.bin.tar.gz
cd doxygen-1.8.14 && ./configure && make install
