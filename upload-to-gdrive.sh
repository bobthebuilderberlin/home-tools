file_to_upload=$1
into_directory=$2

set -e

echo "Downloading scanned.7z"
rclone --verbose copy gdrive:/scanned.7z scanned.7z

echo "Uploading '$file_to_upload' into scanned.7z folder '$into_directory'..."
# add file to archive
7z a scanned.7z "$file_to_upload" -p"$(cat password)"
# put it to the correct folder
7z rn scanned.7z "$file_to_upload" "scanned/${into_directory}/${file_to_upload}" -p"$(cat password)"

# uploading scanned
rclone --verbose move scanned.7z gdrive:/scanned.7z

echo "Done."