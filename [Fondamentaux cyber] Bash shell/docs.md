## accessrights.sh
Usage : accessrights.sh
Le script crée les nouveaux utilisateur automatiquement via la liste en format CSV, de base le chiffre dans nb_list.txt est à 1 (il sert a stocker le nb de ligne et ou reprendre dans le fichier pour ne pas recrée les utilisateur en boucle !)

## add.sh

Usage : add.sh number1 number2
Add.sh ajoute number1 à number2 et renvoie le résultat

## argument.sh

Usage : argument.sh newfile oldfile
argument.sh met le contenu de oldfile dans newfile via la commande cat

## get_logs.sh
Usage : get_logs.sh
get_logs.sh récupére les logs de connection sur la machine et compte le nombre de connection sur cette derniére, il en fait une archive toute les 30 minutes
Il enregistre le fichier dans le dossier temporaire (/tmp/) pour en faire une archive qu'il stock dans ~/Backup/. Il peut être utilisé pour une tache CRON

## hello_bye.sh

Usage : hello_bye.sh hello/bye
hello_bye.sh renvoie un message différent selon si c'est hello ou bye qui est entré en paramètre

## myfirstscript.sh

Usage : myfirstscript.sh
myfirstscript.sh renvoie le message "i'm a script".

## myloop.sh

Usage : myloop.sh
myloop.sh renvoie le message "Je suis un script qui arrive a faire une boucle $i" en remplacent $i par les chiffres de 1 à 10.

## myupdate.sh

Usage : myupdate.sh
myupdate.sh met a jours les repos et les packet sur le systéme