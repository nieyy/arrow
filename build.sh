#!/bin/bash

CUR_DIR=`pwd`

# Cleanup
rm -rf pkgs/
mkdir -p pkgs
cd $CUR_DIR/cpp
rm -rf build/
mkdir -p build

# Generate Makefile
cd $CUR_DIR/cpp/build
cmake -DCMAKE_INSTALL_PREFIX=$CUR_DIR/pkgs -DARROW_FLIGHT=ON -DARROW_FLIGHT_SQL=ON -DARROW_PARQUET=ON -DARROW_CSV=ON -DARROW_SUBSTRAIT=ON ..

# Make
make -j24

# Install packages
make install

# Restore to main branch
cd $CUR_DIR
