count_objects() {
    local dirs=("$@")

    for path in "${dirs[@]}"; do
        if [[ -d "$path" ]]; then
            local count=$(ls -1 "$path" | wc -l)
            echo "Hakemistossa '$path' on $count objektia"
        else
            echo "Virhe: '$path' ei ole hakemisto!"
        fi
    done
}

# Kysyy käyttäjältä polkuja
paths=()

echo "Anna polkuja (exit lopettaa):"
while true; do
    read -p "> " p
    if [[ "$p" == "exit" ]]; then
        break
    fi
    paths+=("$p")
done

count_objects "${paths[@]}"