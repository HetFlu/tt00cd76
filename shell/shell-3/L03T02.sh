# Funktio laskee hakemiston objektien määrän
count_objects() {
    # Paikallinen muuttuja
    local count=$(ls -1 | wc -l)

    echo "Hakemistossa on $count objektia"
}

# Kutsutaan funktiota
count_objects