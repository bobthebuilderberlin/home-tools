#!/usr/bin/env bash
read -p "directory: " directory_to_put_it
./scan.sh
file_to_upload=$(ls -t *.jpg | head -n 1)
./upload-to-gdrive.sh "$file_to_upload" "$directory_to_put_it"
mkdir -p recently-scanned/
mv "$file_to_upload" recently-scanned/