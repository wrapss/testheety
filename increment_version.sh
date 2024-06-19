#!/bin/bash

latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)

version_name=$(echo $latest_tag | cut -d "-" -f 1)

current_version=$(grep 'version:' pubspec.yaml | sed 's/version: //')
current_build_number=$(echo $current_version | cut -d "+" -f 2)

if [ -z "$current_build_number" ]; then
  current_build_number=0
fi

new_build_number=$((current_build_number + 1))

sed -i.bak "s/version: .*/version: $version_name+$new_build_number/" pubspec.yaml

echo "Version incrémentée à $version_name+$new_build_number"
