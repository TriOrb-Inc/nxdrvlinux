#!bin/bash
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
mkdir ./demo_build
cd demo_build
cmake ../examples/ -DDEBUG=ON &&\
    make
./cifx_api