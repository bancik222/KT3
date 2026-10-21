#!/usr/bin/env bash
set -euo pipefail
# Rebuild ONLY shared library. Do not recompile or relink a.out.
g++ -std=c++17 -O2 -fPIC -DLIB_UPDATED -Iinclude -c src/ChessMath.cpp -o build/ChessMath_shared.o
g++ -shared -o build/libchessmath.so build/ChessMath_shared.o
