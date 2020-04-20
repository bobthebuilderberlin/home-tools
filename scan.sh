#!/usr/bin/env bash

read -p "filename(without file ending): " filename


# - scans an image from a Canon LiDE 110 scanner (or any other scanner that supports SANE
# - converts it to jpg
scanimage  --mode Color --resolution 300 --format tiff > scanned.tiff
convert scanned.tiff "$filename".jpg && rm scanned.tiff


