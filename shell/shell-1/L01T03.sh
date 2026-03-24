read -p "Enter directory path: " dir

if [ ! -d "$dir" ]; then
    echo "Directory does not exist!"
    exit 1
fi

count=$(ls -1 "$dir" | wc -l)

echo "Objects in directory: $count"
