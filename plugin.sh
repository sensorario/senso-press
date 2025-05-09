#!/bin/bash

set -e  # Ferma lo script in caso di errore

PLUGIN_LIST_FILE="plugins.txt"

if [[ ! -f "$PLUGIN_LIST_FILE" ]]; then
  echo "❌ File $PLUGIN_LIST_FILE non trovato."
  exit 1
fi

mkdir -p plugins

while IFS= read -r plugin || [[ -n "$plugin" ]]; do
    [[ "$plugin" =~ ^#.*$ || -z "$plugin" ]] && continue  # ignora commenti e righe vuote

    echo "📥 Downloading $plugin..."
    archive="plugins/$(basename "$plugin")"
    curl -L -o "$archive" "$plugin"
    
    echo "📦 Extracting $archive..."
    unzip -qo "$archive" -d plugins  # Add -o to overwrite without prompting
    
    echo "🧹 Removing $archive..."
    rm "$archive"
done < "$PLUGIN_LIST_FILE"