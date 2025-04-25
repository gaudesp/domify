# Domify 🏠🔌
**Domify** est une application web et mobile développée en **Dart** avec **Flutter**, permettant aux utilisateurs de gérer et contrôler leurs maisons et appareils connectés de manière intuitive.

## ⚙️ Prérequis
- **Flutter** (*version* : `3.7.2`)
- **Dart** (*inclus avec Flutter*)
- Un **terminal** compatible **Bash** (*sur WSL ou Unix-like*)
- Un **appareil** / **simulateur iOS** *ou* un **navigateur** pour l'exécution Web
- Les **droits d'exécution** sur le script **run.sh** : `chmod +x run.sh`

## 🚀 Setup
1. **Clonez le repo** :  
```bash
git clone git@github.com:gaudesp/domify.git
cd domify
```

2. **Lancez le script** :
```bash
./run.sh
```

3. **Accédez à l'application localement** :
- APP accessible via : [http://localhost:8620/](http://localhost:8620/) (*avec Option 1 - Web*)
- APP accessible depuis votre appareil / simulateur iOS (*avec Option 2 - iOS*)

## 📦 Dépendances
- `flutter` : Framework principal utilisé pour construire l’interface utilisateur.
- `hive` : Base de données légère NoSQL pour stocker localement les maisons et les appareils.
- `hive_flutter` : Intégration de Hive avec Flutter pour une gestion simple des états.
- `cupertino_icons` : Ensemble d’icônes style iOS pour les interfaces utilisateur.
- `hive_generator` & `build_runner` : Utilisés pour la génération d’adapters Hive via annotations (@HiveType, etc.).
- `flutter_lints`* : Ensemble de règles de linting pour maintenir une base de code propre.

## 🤝 Contribution
Lead developer : [@gaudesp](https://github.com/gaudesp)
