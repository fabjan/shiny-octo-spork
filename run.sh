#! /bin/sh

echo "Which file do you want to run?"
echo "1. main_struct.lua (Love is a struct using the Lua struct)"
echo "2. main_func.lua (Love is a functor using the LUA signature)"

read -r file

case $file in
    1)
        cp main_struct.lua main.lua
        ;;
    2)
        cp main_func.lua main.lua
        ;;
    *)
        echo "Invalid file name!"
        exit 1
        ;;
esac

echo "Starting Love2D..."
love .
