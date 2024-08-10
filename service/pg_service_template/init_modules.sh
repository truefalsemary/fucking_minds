#!/bin/bash

cd third_party
git clone --depth 1 https://github.com/userver-framework/userver.git
cd ..
pwd=$( pwd )
cmake -B$pwd/cmake_build -S$pwd -DCMAKE_EXPORT_COMPILE_COMMANDS=1
