#!/bin/bash

echo "Sélectionnez la plateforme pour le build:"
echo "1) Web"
echo "2) iOS"
read -p "Choisissez (1 ou 2) : " platform

read -p "Souhaitez-vous nettoyer et mettre à jour les dépendances ? (y/n) : " update_choice
read -p "Souhaitez-vous faire un build complet ? (y/n) : " build_choice

if [ "$update_choice" == "y" ]; then
  flutter clean
  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs
fi

case "$platform" in
  1) 
    [ "$build_choice" == "y" ] && flutter build web 
    flutter run -d web-server --web-port=8620
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
