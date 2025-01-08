#!/bin/bash
#Création du nom du fichier
date_file=$(date --iso-8601=minutes)
filename="number_connection-${date_file:8:2}-${date_file:5:2}-${date_file:0:4}-${date_file:11:5}"
#Récupération de la liste des utilisateurs, si UID>1000 -> Pas utilisateur systéme.
user_string="$(awk -F: '$3 >= 1000 && $3 < 60000 { print $1 }' /etc/passwd)"
#Transformation en une liste, pour pouvoir check pour chaque user
user_array=($user_string)
# Pour chaque utilisateur, on met son nombre de connections
for item in "${user_array[@]}"; do
    count=$(last | grep -c "$item")
    echo "Nombre de connexion pour $item : $count" >> "/tmp/$filename"
done
# On compresse et on met dans le dossier Backup
cd /tmp/ && tar -cf "$HOME/Backup/$filename.tar" "$filename"