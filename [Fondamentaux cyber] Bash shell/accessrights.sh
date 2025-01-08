#!/bin/bash
file="Shell_Userlist.csv" #Nom du fichier contenant les utilisateurs

while IFS= read -r line; do
    #On récupére les données pour chaque utilisateur
    prenom=$(echo $line | cut -d ',' -f 2)
    nom=$(echo $line | cut -d ',' -f 3)
    mdp=$(echo $line | cut -d ',' -f 4)
    mdp_hashed=$(openssl passwd -1 $mdp) #Useradd veut un mdp hashé
    type_user=$(echo $line | cut -d ',' -f 5)
    username=$((prenom+nom)) #On crée le nom d'utilisateur avec le prénom et nom de l'utilisateur (on colle le nom et prénom)
    #On crée l'utilisateur avec les infos récupérées
    useradd -m -p "$mdp_hashed" $username
    #-m -> Repertoire home -p -> POur le mdp 
    #On met les droits superuser au Adminitrateur
    if [ "$type_user" = "Admin" ]; then
        usermod -aG sudo $username
    fi
done < "$file"