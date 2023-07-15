# Déploiement de TheHive et Cortex

Ce dépôt contient les fichiers YAML nécessaires pour déployer les composants de TheHive et Cortex sur le cluster AKS. Les fichiers sont organisés comme suit :

##  Les Fichiers 

### thehive.yml

Ce fichier contient les définitions des ressources Kubernetes pour déployer les services  nécessaires à TheHive.

### cortex-service.yml

Ce fichier contient lle service Kubernetes pour Cortex. Il expose le port 9001 et dirige le trafic vers les pods Cortex .

### cortex-deployment.yml

Ce fichier contient le déploiement Kubernetes pour Cortex. Il déploie un seul pod Cortex avec l'image `thehiveproject/cortex:3.1.7`.

### cortex-claim0-persistentvolumeclaim.yaml

Ce fichier contient la définition d'une demande de volume persistant (Persistent Volume Claim) pour Cortex.

## Déploiement

1. Il faut s'assurer d'avoir un cluster Kubernetes fonctionnel et configuré localement.

2. Clonez ce dépôt sur la machine en locale :

   ```shell
   git clone git@github.com:devopsmbj/projetm2.git
Accédez au répertoire cloné :
 avec la commande "cd projetm2/thehive-cortex"


3. Déployez les ressources pour TheHive sur Kubernetes :
avec la commande "kubectl apply -f thehive.yml"

4. Déployez les ressources pour Cortex sur Kubernetes :
-   kubectl apply -f cortex-service.yml
-   kubectl apply -f cortex-deployment.yml
-   kubectl apply -f cortex-claim-persistentvolume.yml

Cela déploiera le service, le déploiement et la demande de volume persistant pour Cortex.

5.  il faut vérifier que toutes les ressources ont été déployées :

    avec la commande: "kubectl get all -n thehive"



