#!/bin/bash

for polku in "$@"; do

    if [ -f "$polku" ]; then
        echo "$polku on tiedosto."

    elif [ -d "$polku" ]; then
        echo "$polku on hakemisto."

    else
        echo "$polku on jotain muuta tai sitä ei ole olemassa."
    fi

done