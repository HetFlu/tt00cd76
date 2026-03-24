read -p "Enter filename: " name

date_suffix=$(date +%F)

filepath="$HOME/${name}_${date_suffix}.txt"

touch "$filepath"

echo "Created file: $filepath"