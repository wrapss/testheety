#!/bin/bash

# Récupérer le dernier tag Git
last_tag=$(git describe --tags --abbrev=0)
echo "Dernier tag: $last_tag"

# Séparer les parties de la version (assume que la version est au format vX.X.X)
IFS='.' read -r -a version_parts <<< "${last_tag//v/}"

# Incrémenter la version
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}

# Incrémenter le numéro de patch
patch=$((patch + 1))

# Construire le nouveau tag
new_tag="v$major.$minor.$patch"
echo "Nouveau tag: $new_tag"

# Taguer le commit actuel avec le nouveau tag
git tag $new_tag
git push origin $new_tag

# Retourner la nouvelle version
echo $new_tag
