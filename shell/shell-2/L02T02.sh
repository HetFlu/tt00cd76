#!/bin/bash

FILE="/etc/hosts"

if [ -e "$FILE" ]; then
    echo "$FILE löytyy."

    if [ -w "$FILE" ]; then
        echo "Sinulla on oikeus muokata tiedostoa."
    else
        echo "Sinulla ei ole oikeutta muokata tiedostoa."
    fi

else
    echo "$FILE ei ole olemassa."
fi