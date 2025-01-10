#!/bin/bash
regex="^[+]+[0-9]"
if [[ $1 =~ $regex ]]; then
    echo "Le numéro est valide"
else 
    echo "Le numéro est invalide"
fi