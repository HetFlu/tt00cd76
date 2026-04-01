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


cd /c/Users/1/Documents/tt00cd76/shell/shell-3
./L03T01.sh
./L03T02.sh
./L03T03.sh
/c/Users/1/Documents


./L03T04.sh
/c/Users/1/Documents
/c/Users/1/Desktop

./L03T05.sh