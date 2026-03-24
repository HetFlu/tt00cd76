#!/bin/bash

read -p "Käyttäjänimi: " USERNAME

if id -u "$USERNAME" >/dev/null 2>&1; then
    echo "Käyttäjä $USERNAME on jo olemassa."
    exit 1
fi

sudo useradd -m -d /home/"$USERNAME" -s /bin/bash "$USERNAME"

if [[ $? -eq 0 ]]; then
    echo "Käyttäjä $USERNAME luotu."
else
    echo "Virhe!!! Käyttäjän luonti epäonnistui"
fi