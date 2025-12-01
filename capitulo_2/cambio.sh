#!/bin/bash

for i in e_*
do
    # Comprueba que el elemento sea un archivo y no un directorio
    if [[ -f "$i" ]]
    then
        # Comprueba si el nombre del archivo contiene un punto
        if [[ "$i" == *.* ]]
        then
            echo "El archivo '$i' ya tiene una extensión. Saltando."
        else
            # Crea el nuevo nombre y renombra el archivo
            new_name="${i}.rkt"
            mv -- "$i" "$new_name"
            echo "Renombrado '$i' a '$new_name'."
        fi
    fi
done
