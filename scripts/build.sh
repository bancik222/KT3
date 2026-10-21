#!/usr/bin/env bash
set -euo pipefail
mkdir -p build
# Compile library separately.
g++ -std=c++17 -O2 -Iinclude -c src/ChessMath.cpp -o build/ChessMath_static.o
ar rcs build/libchessmath.a build/ChessMath_static.o
g++ -std=c++17 -O2 -Iinclude src/main.cpp build/libchessmath.a -o build/chess_static
# Shared library: position-independent code.
g++ -std=c++17 -O2 -fPIC -Iinclude -c src/ChessMath.cpp -o build/ChessMath_shared.o
g++ -shared -o build/libchessmath.so build/ChessMath_shared.o
g++ -std=c++17 -O2 -Iinclude src/main.cpp -Lbuild -lchessmath -o build/a.out
