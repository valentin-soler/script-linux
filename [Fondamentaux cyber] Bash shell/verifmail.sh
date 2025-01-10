#!/bin/bash
#Regex --> [a-zA-Z0-9._%+-] -> 1ére parti du mail, il ne peut pas y avoir d'autre caractére que chiffres/lettres, ., -, +,_
#@[a-zA-Z0-9.-] --> On vérifie que aprés il y a bien un arobase et un nom de domaine
#[a-zA-Z]{2,} --> On vérifie que l'extention du nom de domaine est valide
regex="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
if [ "$(echo "$1" | grep "@")" == "" ]; then
    echo "L'adresse mail n'est pas bonne"
fi