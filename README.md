<p align="center">   <img src="app/assets/images/catlogo.png?raw=true" width="200"> </p> <p align="center">   <img src="app/assets/images/hello-kitten.png?raw=true" width="200"> </p>

# HELLO KITTEN - HACKING TEAM PROJECT



## Sites internet
[hello-kitten](http://www.hello-kitten.com/) : http://www.hello-kitten.com/

### Repository GitHub
[kitten-project](https://github.com/the-hacking-team/kitten-project)

### Sites Heroku
[developpement](https://develop-hello-kitten.herokuapp.com)

[production](https://hello-kitten.herokuapp.com)


## Environnement :

1- Ruby version 2.7.1

2- Rails version 5.2.4

3- CSS : Bootstrap

4- API Utilisées:

* SendGrid : https://sendgrid.com/
* Stripe avec la gem [stripe](https://github.com/stripe/stripe-ruby) 
* Open_letter :  

## Contributeurs

- [:bell: Stanislas BASQUIN](https://github.com/StanislasBASQUIN)
- [:mega: Mathieu JOLY](https://github.com/mathieu-superpose)
- [:santa: Vivien Ploix](https://github.com/Vivien-Ploix)
- [:godmode: Mathieu Voland](https://github.com/mvoland)
- [:business_suit_levitating: Laurent Saives](https://github.com/Laurent-Gi)

## Mentor et formation
- [Roman Cecil](https://github.com/Roman-Cecile)

## Projet fait grace a la formation :
- [©The Hackig Project 👽](https://www.thehackingproject.org/)

<br>

# Méthodologie de travail dans l'équipe
Dirige toi via ton terminal dans le dossier que tu souhaites, et suis la méthodologie que tu trouveras dans les Wiki du projet :

[Instruction pour travailler proprement dans l'équipe](https://github.com/the-hacking-team/kitten-project/wiki/Workflow-GitHub)

<br>

# Le Kitten-Board
Ceci est un projet qui dure plusieurs jours, dans lequel nous allons vous faire faire le projet via la méthodologie agile, en utilisant le principe des user stories. C'est une excellente méthodologie pour mettre en production très rapidement une version fonctionnelle d'un site.

Ce projet a plusieurs objectifs :

vous prouver que vous savez mettre en ligne des sites complexes, en vous faisant faire un site complexe et professionnel
vous donner un exemple de méthodologie pour la semaine prochaine, afin que vous ne soyez pas trop destabilisé par le syndrome de la page blanche
vous montrer que les deux semaines de projet final vont passer à une vitesse folle, et que pour avoir une version fonctionnelle le jour des demo days, penser MVP n'est pas de trop ;)

<br>

# Présentation du site
## Pitch
Pour le projet, vous allez créer une boutique en ligne, pour un magasin de photos de chatons. La boutique va afficher les différents produits, puis les clients pourront s'inscrire, remplir leur panier, et payer l'objet avec Stripe pour le recevoir par email.

## MVP
Évidemment, pour cette boutique en ligne, nous pourrions intégrer des features à la pelle (possibilité de remplir un panier quand on n'est pas login, dashboard administrateur, etc). Cependant, nous allons en profiter pour t'apprendre quelque chose d'indispensable : la notion de MVP.

Nous allons minimaliser l'e-boutique pour que vous puissiez mettre en ligne une version minimaliste, mais fonctionnelle. Puis à partir de cette version minimaliste, vous n'aurez qu'à ajouter des features pour la rendre plus agréable.

Le but est qu'à la fin du projet rendu, vous ayez un projet solide, fonctionnel, et en production. Et vous pourrez ajouter des fonctionnalités facilement.

## Version minimaliste
La version minimaliste du site est la suivante :

Vous allez coder une boutique en ligne, qui vend des photos de chatons. La page d'accueil du site comprendra la liste des produits qui sont à vendre. Un visiteur peut cliquer sur l'un des produits pour l'afficher et avoir plus de détails sur le produit. Le visiteur devra s'inscrire pour ajouter ce produit à son panier.

Un utilisateur peut accéder facilement à son panier, modifier la quantité de produits à acheter, puis accéder au checkout pour payer. Il paiera via Stripe le total, il recevra un email avec la·les photo·s de chaton·s. L'administrateur du site recevra aussi un email avec le récapitulatif de la commande qui vient d'être passée.

Nous demanderons pour la version minimaliste un fichier `seed.rb` qui contient quelques exemples de produits, pour que toute l'équipe de développement puisse en profiter.

## Quelques fonctionnalités à ajouter
Une fois que le MVP est sorti et fonctionnel, déjà vous pouvez vous féliciter du travail bien fait. Vous avez sorti un site en production qui marche pour de vrai, et vous pouvez presque vendre ce type de site à des futurs clients potentiels.

Évidemment, le principe du MVP est l'itération : ainsi, nous avons prévu des fonctionnalités en plus pour que vous puissiez vous entraîner sur l'ajout de fonctionnalités. Vous pouvez choisir celles que vous voulez faire, en fonction de ce que vous pensez de plus malin :

- Ajout d'un dashboard Admin, qui fait un état des lieux des commandes effectuées (inclus dans notre projet)
- Ajout d'un type de user "admin", qui peut créer et modifier des produits (inclus dans notre projet)
- Possibilité pour un visiteur du site d'avoir un panier de commande
- Ajout d'un système de catégorisation des produits
- Pouvoir acheter plusieurs exemplaires du même produit dans une même commande