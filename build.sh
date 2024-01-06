#! /bin/sh

set -e

echo "===> Compiling main.mlb..."
lunarml compile --luajit main.mlb

echo "===> Done!"
