read -p "Enter source file path: " src

if [ ! -f "$src" ]; then
    echo "Source file does not exist!"
    exit 1
fi

read -p "Enter destination path: " dest

cp "$src" "$dest"

echo "File copied from $src to $dest"