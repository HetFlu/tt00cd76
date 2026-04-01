# Funktio objektien määrän laskemiseen annetusta polusta
count_objects() {
    local path="$1"
    local count=$(ls -1 "$path" | wc -l)

    echo "Hakemistossa '$path' on $count objektia"
}

read -p "Anna hakemistopolku: " dirpath

count_objects "$dirpath"