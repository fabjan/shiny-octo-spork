#! /bin/sh

echo "===> Compiling main_func.mlb..."
lunarml compile --luajit main_func.mlb

echo "===> Compiling main_struct.mlb..."
lunarml compile --luajit main_struct.mlb

echo "===> Done!"
