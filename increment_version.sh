#!/bin/bash

# Lire la version actuelle du fichier pubspec.yaml
version=$(grep 'version:' pubspec.yaml | sed 's/version: //')
version_name=$(echo $version | cut -d "+" -f 1)
build_number=$(echo $version | cut -d "+" -f 2)

# Incrémenter le numéro de build
new_build_number=$((build_number + 1))

# Mettre à jour le fichier pubspec.yaml avec la nouvelle version
sed -i.bak "s/version: $version_name+$build_number/version: $version_name+$new_build_number/" pubspec.yaml

echo "Version incrémentée à $version_name+$new_build_number"
