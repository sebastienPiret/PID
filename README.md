# PID
projet intégration développement

Ipam La louvière
26 Juin 2020

Professeur: Mr Dutrieux

étudiant: Sébastien Piret

Instructions
-

Back-end et front-end sont intégrés dans le même projet.
Il a été réalisé avec Intellij, il semble préférable de l'ouvrir avec ce dernier.
Je n'ai pas testé avec d'autres IDE.

La base de donnée est sous mssql (pour le travail, via un conteneur docker)
avec les informations suivantes de connexions: 

* url: jdbc:sqlserver://localhost:1433;database=biblio
* login: sa
* mdp: MyStrongPassword@
* Le backup de la bdd est dans BiblioApi/img/file.bak

Le projet nécessite un maven clean install niveau back-end, et un npm install niveau front end.

Une fois le backend lancé (via fleche play avec BiblioApplication comme configuration),
vous pouvez accéder à tous les liens via localhost:8080

Le frontend est accessible via ng serve sur l'adresse localhost:4200

Pour accéder au panel administrateur du front-end: localhost:4200/admin

Fonctionnalités
-

Ont été implémentées côté emprunteur:
* L'enregistrement d'une nouvel utilisateur
* Le login via mail et mdp 
* L'affichage de la liste des livres 
* La sélection et l'affichage d'un livre au choix
* La mise au panier du livre en question
* L'affichage du panier et l'action d'emprunter le livre
* L'affichage et la modification de l'utilisateur
* L'affichage des emprunts en cours ou terminés

emprunteur déjà enregistré:
* Login: sebpiret@gmail.com
* mdp: 123

Côté administrateur:
* Le login e l'administrateur
* l'affichage et la modification de ses coordonnées
* La liste des emprunts en cours et la possibilité de remettre l'exemplaire de chaque emprunt
en circulation

administrateur enregistré:
* Login: sebpiret@hotmail.com
* mdp: 123

Restrictions
-

* Je n'ai pas eu le temps de hasher/ dehasher les mots de passe dans les coordonnées des utilisateurs, mieux vaut
 donc ne pas les modifier...
 * Je n'ai pas non plus eu le temps de renvoyer de message d'erreur si on essaie de se connecter au panel admin avec
  un utilisateur disposant d'un rôle non-admin
  * Plus toutes les autres fonctionnalités que je n'ai malheureusement pas eu non plus le temps d'implémenter


