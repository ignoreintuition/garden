#!/bin/bash

# Build mgs
/Applications/PICO-8.app/Contents/MacOS/pico8 flower.p8 -export dist/flower.p8.png

# Run mgs
/Applications/PICO-8.app/Contents/MacOS/pico8 -windowed 0 -run flower.p8 