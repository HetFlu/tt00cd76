# Funktio laskee hakemiston objektien määrän
count_objects() {
    # Paikallinen muuttuja
    local count=$(ls -1 | wc -l)

    echo "Hakemistossa on $count objektia"
}

# Kutsuu funktiota
count_objects