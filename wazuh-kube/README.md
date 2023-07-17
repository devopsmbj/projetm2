# Wazuh Kubernetes
Deployer un cluster Wazuh avec un acces au dashboard via traefik loadbalancer



## Description
Wazuh est une solution de détection et de réponse aux incidents de sécurité, conçue pour aider les organisations à renforcer leur posture de sécurité en surveillant et en analysant les activités de leurs systèmes, réseaux et applications. Basé sur l'architecture ouverte d'OSSEC, Wazuh offre une approche évolutive et flexible pour la détection des menaces, la gestion des journaux et la conformité réglementaire.

## AZURE AKS deployement
Pour déployer un cluster wazuh sur AKS: il faut se placer dans le dossier wazuh-kube
```
 kubectl apply -k envs/local-env/
```
On confugure les ingress et ingressroute necessaire dans traefik donc pour tester wazuh, il faut deployer et configurer le loadbalancer avec helm:
il faut se placer dans le dossier traefik et l'installer 
```
 helm install --set="additionalArguments={--serverstransport.insecureskipverify=true}" traefik traefik/traefik
```
Pour configrer les ingress et ingressroute de wazuh : il  faut se placer dans le dossier traefik/ingress-rule et apply tous les manifests yamls préfixé de wazuh
```
cd traefik/ingress-rule
```
```
kubectl apply -f wazuh-ing-rt-tcp1.yaml -n wazuh
```
```
kubectl apply -f wazuh-ing-rt-tcp2.yaml -n wazuh
```
```
kubectl apply -f wazuh-ing-rt-tcp3.yaml -n wazuh
```
```
kubectl apply -f wazuh-ingress.yml -n wazuh
```
```
kubectl apply -f wazuh-ingressroute.yaml -n wazuh
```
### le dashbord wazuh est maintenant disponible sur `wazuh.example.com`
#### veuillez à ce que l'address ip du `loadbalancer` traefik et l'adDress DNS `wazuh.example.com` soit renseigné dans le fichier HOST

## Directory structure

    ├── CHANGELOG.md
    ├── cleanup.md
    ├── envs
    │   ├── eks
    │   │   ├── dashboard-resources.yaml
    │   │   ├── indexer-resources.yaml
    │   │   ├── kustomization.yml
    │   │   ├── storage-class.yaml
    │   │   ├── wazuh-master-resources.yaml
    │   │   └── wazuh-worker-resources.yaml
    │   └── local-env
    │       ├── indexer-resources.yaml
    │       ├── kustomization.yml
    │       ├── storage-class.yaml
    │       └── wazuh-resources.yaml
    ├── instructions.md
    ├── LICENSE
    ├── local-environment.md
    ├── README.md
    ├── upgrade.md
    ├── VERSION
    └── wazuh
        ├── base
        │   ├── storage-class.yaml
        │   └── wazuh-ns.yaml
        ├── certs
        │   ├── dashboard_http
        │   │   └── generate_certs.sh
        │   └── indexer_cluster
        │       └── generate_certs.sh
        ├── indexer_stack
        │   ├── wazuh-dashboard
        │   │   ├── dashboard_conf
        │   │   │   └── opensearch_dashboards.yml
        │   │   ├── dashboard-deploy.yaml
        │   │   └── dashboard-svc.yaml
        │   └── wazuh-indexer
        │       ├── cluster
        │       │   ├── indexer-api-svc.yaml
        │       │   └── indexer-sts.yaml
        │       ├── indexer_conf
        │       │   ├── internal_users.yml
        │       │   └── opensearch.yml
        │       └── indexer-svc.yaml
        ├── kustomization.yml
        ├── secrets
        │   ├── dashboard-cred-secret.yaml
        │   ├── indexer-cred-secret.yaml
        │   ├── wazuh-api-cred-secret.yaml
        │   ├── wazuh-authd-pass-secret.yaml
        │   └── wazuh-cluster-key-secret.yaml
        └── wazuh_managers
            ├── wazuh-cluster-svc.yaml
            ├── wazuh_conf
            │   ├── master.conf
            │   └── worker.conf
            ├── wazuh-master-sts.yaml
            ├── wazuh-master-svc.yaml
            ├── wazuh-workers-svc.yaml
            └── wazuh-worker-sts.yaml


## Branches

* `master` branch contains the latest code, be aware of possible bugs on this branch.
* `stable` branch on correspond to the last Wazuh stable version.


## License and copyright

WAZUH
Copyright (C) 2016, Wazuh Inc.  (License GPLv2)

## References

* [Wazuh website](http://wazuh.com)
