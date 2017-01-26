#!/bin/bash
set -x
set -e
set -u

mkdir temp
cd temp
cmake -G "Unix Makefiles" ../../thrift-*/ -DCMAKE_BUILD_TYPE=Release -DBUILD_COMPILER=ON -DBUILD_LIBRARIES=OFF -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF 
cmake --build . --config Release
cmake -DCMAKE_INSTALL_PREFIX=../install -P cmake_install.cmake


