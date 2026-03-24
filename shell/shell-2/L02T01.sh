#!/bin/bash

read -p "Poistettava tiedosto: " FILE

if [[ -f "$FILE" ]]; then
    if [[ ! -s "$FILE" ]]; then
        rm "$FILE"
        echo "Tiedosto poistettu."
    else
        echo "Virhe! Tiedosto ei ole tyhjä."
    fi
else
    echo "Virhe! Tiedostoa ei ole."
fi



cd /c/Users/hetaf/Documents/tt00cd76/shell/shell-2

./L02T01.sh
testitiedosto

./L02T02.sh

./L02T03.sh testi1
./L02T03.sh testikansio

./L02T04.sh
testi

./L02T05.sh
