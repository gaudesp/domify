#!/bin/bash

# Choisir la plateforme pour le build
echo "Sélectionnez la plateforme pour le build:"
echo "1) Web"
echo "2) iOS"
read -p "Choisissez (1 ou 2) : " platform

# Nettoyer / mettre à jour les dépendances
read -p "Souhaitez-vous nettoyer et mettre à jour les dépendances ? (y/n) : " update_choice

if [ "$update_choice" == "y" ]; then
  flutter clean
  flutter pub get
  flutter pub upgrade --major-versions
  flutter pub run build_runner build --delete-conflicting-outputs
fi

# Demander si un build complet est nécessaire
read -p "Souhaitez-vous faire un build complet ? (y/n) : " build_choice

# Exécution de la plateforme choisie
case "$platform" in
  1) 
    flutter run -d web-server
    [ "$build_choice" == "y" ] && flutter build web 
    ;;
  2)
    device=$(flutter devices | grep "iPhone" | awk '{print $1}')
    if [ -n "$device" ]; then
      [ "$build_choice" == "y" ] && flutter build ios
      flutter run -d "$device"
    else
      echo "❌ Aucun iPhone détecté !"
    fi
    ;;
  *)
    echo "❌ Choix invalide."
    ;;
esac
