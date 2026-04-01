# --- LASKINFUNKTIOT ---

summa() {
    echo $(($1 + $2))
}

erotus() {
    echo $(($1 - $2))
}

kerto() {
    echo $(($1 * $2))
}

jako() {
    if [[ $2 -eq 0 ]]; then
        echo "Nollalla ei voi jakaa!"
    else
        echo $(($1 / $2))
    fi
}

# --- PÄÄOHJELMA ---
echo "Yksinkertainen laskin (toiminnot: + - * / )"

read -p "Anna 1. luku: " a
read -p "Anna 2. luku: " b
read -p "Anna operaatio (+ - * /): " op

case $op in
    +) tulos=$(summa $a $b) ;;
    -) tulos=$(erotus $a $b) ;;
    *) tulos=$(kerto $a $b) ;;
    /) tulos=$(jako $a $b) ;;
    *) echo "Tuntematon operaatio!" ; exit 1 ;;
esac

echo "Tulos: $tulos"