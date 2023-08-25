#!/bin/bash

# Check support
# ==================================================================

if ! command -v dart &> /dev/null ; then
    echo "Dart don't install, please install and set it to path"
    echo "End install, Exit........."
    exit 0
fi

# Constants value
# ==================================================================

ZSHRC_URI="$HOME/.zshrc"
EXPORT_CONTENT="export PATH=\"\$PATH:$HOME/.pub-cache/bin\""

# Functions define
# ==================================================================

createAndWriteString() {
  PATH_URI=$1
  CONTENT=$2

  if [ ! -f "$PATH_URI" ]; then
    echo "File does not exist, Start creating file..."
    touch $PATH_URI
  fi

  if [[ ! $(<$PATH_URI) == *"$CONTENT"* ]]; then
    echo "Path not found, Start adding path to file..."
    echo $CONTENT >> $PATH_URI
  fi
}

# Create and write
# ==================================================================

createAndWriteString $ZSHRC_URI $EXPORT_CONTENT

# Active dart global
# ==================================================================
dart pub global activate melos