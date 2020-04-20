file_to_upload=$1
into_directory=$2

set -e

echo "Downloading scanned.7z"
scanned_7z_id=$(./gdrive-linux-x64 --service-account gdrive-token.json list  | grep scanned.7z | head -n 1 | awk '{print $1}')
./gdrive-linux-x64 --service-account gdrive-token.json download $scanned_7z_id --force

echo "Uploading '$file_to_upload' into scanned.7z folder '$into_directory'..."
# add file to archive
7z a scanned.7z "$file_to_upload" -p"$(cat password)"
# put it to the correct folder
7z rn scanned.7z "$file_to_upload" "scanned/${into_directory}/${file_to_upload}" -p"$(cat password)"

# uploading scanned
./gdrive-linux-x64 --service-account gdrive-token.json upload scanned.7z

echo "Done."