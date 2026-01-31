## Nom du projet: Smart Recipe Hub

 MEMBRE DU GROUPE :

## Franck Joel nzokou  (Développement fullstack, IA, Docker)

## 1. Présentation du Projet

SmartRecipeHub est une application web intelligente de gestion de recettes de cuisine.
Elle permet aux utilisateurs de chercher, créer et gérer leurs propres recettes, tout en recevant des suggestions automatiques basées sur leurs goûts et les ingrédients qu’ils possèdent.

L’objectif est de créer une plateforme simple, pratique et moderne pour aider les utilisateurs à mieux cuisiner, éviter le gaspillage alimentaire et découvrir de nouvelles idées de plats.

Concrètement, un utilisateur peut :

Taper les ingrédients qu’il a dans son frigo

Voir les recettes possibles

Enregistrer ses recettes préférées

Et recevoir des recommandations adaptées à ses habitudes

## Fonctionnalités principales

Création, modification et suppression de recettes (CRUD)
L’utilisateur peut ajouter ses propres recettes, les modifier ou les supprimer.

Recherche intelligente
Possibilité de rechercher des recettes par :

Nom

Ingrédients

Tags (végétarien, dessert, rapide, etc.)

Suggestions automatiques de recettes
Le système analyse :

Les recettes consultées

Les ingrédients utilisés

Les préférences
Pour proposer des recettes pertinentes.

Compte utilisateur
Connexion avec email et mot de passe pour :

Sauvegarder ses recettes

Retrouver son historique

Avoir des recommandations personnalisées

API REST
Le frontend (site web) communique avec le backend via une API moderne.

 ## Exposition publique via Cloudflare Tunnel:


## Screenshot de l'application déployée : 
<img width="938" height="418" alt="image page accueil" src="https://github.com/user-attachments/assets/7a260657-a8c3-4527-b88e-3060518eb032" />

<img width="938" height="423" alt="image dashboard" src="https://github.com/user-attachments/assets/defe2b2f-8dc9-4342-b770-4c134d87e02c" />

<img width="851" height="444" alt="images inscription" src="https://github.com/user-attachments/assets/273e63a3-e762-4309-8596-b6e7994a8a2a" />

<img width="839" height="434" alt="image connexion" src="https://github.com/user-attachments/assets/a5fcc08e-22bc-469a-8beb-361a7d2a7453" />




## 2. Architecture Technique
Schéma d'infrastructure

![Architecture du Projet](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/franck123-ing-web/smart-recipe-hub-doc/main/architecture.puml)

## Description des services
| Service      | Image Docker   | Rôle                                                               | Port Interne |
| ------------ | -------------- | ------------------------------------------------------------------ | ------------ |
| **Proxy**    | `caddy:latest` | Sert de point d’entrée et redirige le trafic vers le bon service   | 80           |
| **Frontend** | `node:18`      | Application React affichée à l’utilisateur                         | 5173         |
| **Backend**  | `python:3.11`  | API FastAPI qui gère les recettes, utilisateurs et recommandations | 8000         |
| **DB**       | `mysql:8`      | Stocke les utilisateurs et les recettes                            | 3306         |
| **Adminer**  | `adminer`      | Interface web pour gérer la base de données                        | 8080         |
| **Tunnel**   | `cloudflared`  | Rend le site accessible depuis Internet                            | N/A          |


## Comment ça fonctionne
L’utilisateur ouvre le site depuis Internet.

Cloudflared reçoit la requête.

Caddy (le proxy) décide où envoyer la requête :

vers le frontend pour afficher le site

vers le backend pour traiter les données

Le backend communique avec la base de données MySQL.

Le résultat est renvoyé au navigateur de l’utilisateur


## 3. Guide d'installation

Ce guide explique comment lancer tout le projet sur un ordinateur.

## Étape 1 – Cloner le projet

Cela permet de récupérer tous les fichiers du projet :

git clone https://github.com/franck123-ing-web/smart-recipe-hub-doc.git

cd smart-recipe-hub-doc

## Étape 2 – Lancer toute l’application

Toutes les parties du projet (site, serveur, base de données…) sont lancées avec une seule commande :

docker compose up -d

Docker va automatiquement :

Télécharger les images

Démarrer la base de données

Démarrer le backend

Démarrer le frontend

Démarrer le proxy

## Étape 3 – Accéder aux services

| Service                   | Adresse                                        |
| ------------------------- | ---------------------------------------------- |
| Application Web           | [http://localhost](http://localhost)           |
| API Backend               | [http://localhost/api](http://localhost/api)   |
| Base de données (Adminer) | [http://localhost:8080](http://localhost:8080) |

## Étape 4 – Obtenir l’URL publique

Pour voir le lien Internet généré par Cloudflare :

docker compose logs -f tunnel

Tu verras une URL du type :
https://random-name.trycloudflare.com

## 4. Méthodologie & Transparence IA

## Organisation
J'ai travaillé en solo :

Franck Joel : développement du backend, frontend, BD, IA et Docker

Le projet a été découpé en plusieurs étapes :

Conception de l’idée

Architecture technique

Développement backend

Développement frontend

Dockerisation

Tests

Documentation

## Utilisation de l’IA

## Outils utilisés : ChatGPT

Usage :

## Génération de code
J'ai utilisé l’IA pour générer la structure de base du backend FastAPI et du frontend React.

## Débogage
L’IA m'a aidé à comprendre des erreurs Docker, des problèmes de connexion entre les services, et des bugs API.

## Documentation
L’IA a aidé à reformuler les explications pour qu’elles soient claires.

## Apprentissage
L’IA ne faisait pas le projet à ma place :

J'ai compris :

Comment fonctionne Docker

Comment Docker connecte plusieurs services

Comment marche un reverse proxy

## 5. Difficultés rencontrées & Solutions

## Problème :
Le frontend n’arrivait pas à communiquer avec le backend
## Solution :
Correction des URLs et du réseau Docker

## Problème :
La base de données se vidait à chaque redémarrage
## Solution :
Ajout d’un volume Docker pour rendre les données persistantes

## Problème :
Cloudflared ne donnait pas d’URL publique
## Solution :
Correction du token et du service tunnel dans Docker Compose

# Problème 
Les nouveaux utilisateurs ne voyaient pas les recettes
## Solution
Les recettes ont été rendues globales et non liées à un utilisateur

## Problème 
Erreur 502 Bad Gateway avec Cloudflare.
## Solution
L’API n’était pas lancée. Il fallait exécuter uvicorn avant Cloudflared

## Problème 
Les recommandations IA ne s’affichaient pas
## Solution
Correction du calcul TF-IDF et du tri des similarités

## Problème
Les modales n’étaient pas défilables
## Solution
Ajout de max-height et overflow-y:auto








