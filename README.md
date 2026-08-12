# 🌦️ Weather App

Une application mobile Flutter qui affiche la météo en temps réel pour n'importe quelle ville dans le monde, via une recherche par nom.

## ✨ Fonctionnalités

- 🔍 Recherche de la météo par nom de ville
- 🌡️ Température actuelle, condition météo et vitesse du vent
- 🌍 Géocodage automatique (nom de ville → coordonnées GPS)
- ⚡ Données en temps réel via une API publique, sans clé d'authentification

## 🛠️ Stack technique

- **Framework** : Flutter
- **Langage** : Dart
- **Requêtes réseau** : [`http`](https://pub.dev/packages/http)
- **API météo** : [Open-Meteo](https://open-meteo.com/) (gratuite, sans clé API)
- **API géocodage** : [Open-Meteo Geocoding API](https://open-meteo.com/en/docs/geocoding-api)

## 📂 Structure du projet

```
lib/
├── main.dart                    # Point d'entrée de l'application
├── models/
│   └── weather.dart              # Modèle de données Weather
├── screens/
│   └── home_screen.dart          # Écran de recherche + affichage
└── services/
    └── weather_service.dart      # Appels API (géocodage + météo)
```

## ⚙️ Fonctionnement

1. L'utilisateur saisit le nom d'une ville
2. L'app interroge l'**API de géocodage** Open-Meteo pour obtenir latitude/longitude
3. Ces coordonnées sont utilisées pour interroger l'**API météo** Open-Meteo
4. Les données (température, code météo, vent) sont affichées avec un emoji correspondant aux conditions

## 🚀 Installation et lancement

### Prérequis
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installé
- Un émulateur ou un appareil Android/iOS connecté
- Une connexion internet (l'app dépend d'une API en ligne)

### Étapes

```bash
# Cloner le projet
git clone https://github.com/Tsiiva/weather_app.git
cd weather_app

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

## 📱 Aperçu

<!-- Ajoute ici 1-2 captures d'écran de l'app -->

## 📌 Pistes d'amélioration

- Prévisions sur plusieurs jours
- Géolocalisation automatique de l'utilisateur
- Historique des dernières villes recherchées
- Unités configurables (°C / °F)

## 📄 Licence

Projet libre à usage personnel et éducatif.
