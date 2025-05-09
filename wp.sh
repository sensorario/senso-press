#!/bin/bash

set -e  # Ferma lo script in caso di errore

ZIP_URL="https://wordpress.org/latest.zip"
ZIP_FILE="latest.zip"
TARGET_DIR="wp"

echo "📥 Scarico l'ultima versione di WordPress..."
curl -L -o $ZIP_FILE $ZIP_URL

echo "📦 Estraggo l'archivio..."
unzip -q $ZIP_FILE

echo "📁 Sposto i file nella cartella '$TARGET_DIR/'..."
mkdir -p $TARGET_DIR
mv wordpress/* $TARGET_DIR/

echo "🧹 Pulizia..."
rm -rf wordpress $ZIP_FILE

echo "✅ WordPress installato in ./$TARGET_DIR"
