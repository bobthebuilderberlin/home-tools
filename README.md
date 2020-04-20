# Home-Tools 

Some tools I use to manage my documents

## `scan.sh` 
Scans an image using the default scanner with 300 dpi in color mode.
Will ask for a file name to scan to.

## `upload-to-gdrive.sh`
Downloads a 7z archive `scanned.7z` from gdrive, adds a file to it and uploads it again.

### Prerequisites
- installed `7z`
- a google service account json secret located in `~/.gdrive/gdrive-token.json`
- the password of the 7z file stored in file `password` in this folder.

## `scan-and-upload.sh`
Combines the two scripts: First scans and image and then puts it to a directory in the 7z file on gdrive 