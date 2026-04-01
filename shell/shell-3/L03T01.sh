values=()

while true; do
    read -p "Anna arvo (exit lopettaa): " input
    if [[ "$input" == "exit" ]]; then
        break
    fi
    values+=("$input")   # Lisätään arvo arrayhin
done

echo "----- Tallennetut arvot -----"
for i in "${!values[@]}"; do
    echo "$i: ${values[$i]}"   # Tulostetaan index: value
done