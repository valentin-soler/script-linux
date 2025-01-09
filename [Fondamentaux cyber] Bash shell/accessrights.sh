#!/bin/bash
file="Shell_Userlist.csv" #Nom du fichier contenant les utilisateurs
#Il doit ignorer la 1ére ligne !!
nb_ligne_ignore=$(cat nb_list.txt)
nb_ligne=1
while IFS= read -r line; do
    if [ $nb_ligne -le $nb_ligne_ignore ]; then
        nb_ligne=$((nb_ligne+1))
    else
        #On récupére les données pour chaque utilisateur
        prenom=$(echo $line | cut -d ',' -f 2)
        nom=$(echo $line | cut -d ',' -f 3)
        mdp=$(echo $line | cut -d ',' -f 4)
        mdp_hashed=$(openssl passwd -1 $mdp) #Useradd veut un mdp hashé
        type_user=$(echo $line | cut -d ',' -f 5)
        username="${prenom}${nom}" #On crée le nom d'utilisateur avec le prénom et nom de l'utilisateur (on colle le prénom et nom)
        #On crée l'utilisateur avec les infos récupérées
        echo $type_user
        nb_ligne=$((nb_ligne+1))
    fi
done < "$file"

echo $(($nb_ligne - 1)) > "nb_list.txt"