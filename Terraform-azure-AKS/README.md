# Terraform-Azure-AKS

Ce projet Terraform permet de déployer un cluster Kubernetes Azure (AKS) avec une ressource de groupe Azure.


## Installation

1. Clonez le repository GitHub en local attention de bien avoir configuré la clé SSH sur Github.
 : git@github.com:devopsmbj/projetm2.git


2. Accédez au répertoire du projet :
cd projetm2

## Terraform init

3. Initialisez Terraform :
avec la commande "terraform init"

le terraform init est utilisée pour initialiser un projet Terraform dans un répertoire de travail ça va préparer l'environnement Terraform en téléchargeant les plugins requis.


4.  Les fichiers de Configuration

Le projet Terraform est organisé de la manière suivante :

aks.tf : Contient la configuration Terraform pour créer le cluster Kubernetes Azure (AKS) et la ressource de groupe associée.

output.tf : Définit les sorties (outputs) Terraform pour afficher des informations après la création des ressources.

provider.tf : Configure le fournisseur Microsoft Azure pour Terraform.
## Terraform Plan
5. Création des ressources Azure avec la commande "Terraform Plan"

cette commande est utilisée pour créer un plan d'exécution. Terraform lit les fichiers de configuration (tels que aks.tf, output.tf) pour déterminer l'état actuel de l' infrastructure et les modifications apportées depuis la dernière exécution.
## Terraform Apply
6. Lancement avec la commande "terraform apply"


cette commande à pour but d'exécuter le plan d'exécution Terraform et appliquer les changements dee l' infrastructure. ça vérifie l'état actuel de l'infrastructure, crée et met à jour ou supprime les ressources nécessaires pour atteindre l'état souhaité défini dans les fichiers de configuration.

## Terraform output
Récuperer la configuration de AKS dans le tfstate puis créer un fichier `config ` dans  un dossier `.kube` et collé la configuration.
