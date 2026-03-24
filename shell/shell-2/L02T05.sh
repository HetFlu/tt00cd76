#!/bin/bash

while true; do
    echo "Valitse (+, -, *, /) tai kirjoita 'exit' mikäli haluat poistua:"
    read OP
    
 #lopetus
    if [[ "$OP" == "exit" ]]; then
        echo "Heippa"
        break
    fi

    if [[ "$OP" != "+" && "$OP" != "-" && "$OP" != "*" && "$OP" != "/" ]]; then
        echo "Ei ole laskutoimitus"
        continue
    fi

    read -p "Eka numero: " A
    read -p "Toka numero: " B

    case "$OP" in
        +) RES=$((A + B)) ;;
        -) RES=$((A - B)) ;;
        \*) RES=$((A * B)) ;;
        /)
            if [[ "$B" -eq 0 ]]; then
                echo "Virhe: nollalla ei voi jakaa!"
                continue
            fi
            RES=$((A / B))
            ;;
    esac

    echo "Tulos: $RES"
done
