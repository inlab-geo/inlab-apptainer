#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <container-name>"
    echo "Example: $0 inlab.fedora"
    exit 1
fi

DEF_FILE="$1.def"

if [ ! -f "$DEF_FILE" ]; then
    echo "Error: $DEF_FILE not found"
    exit 1
fi

# Always create pip cache
mkdir -p "$HOME/.cache/pip"
BIND_ARGS="--bind $HOME/.cache/pip:/root/.cache/pip"

# Add conda bind mount only if the def file uses miniconda
if grep -q "miniconda" "$DEF_FILE"; then
    mkdir -p "$HOME/.conda/pkgs"
    BIND_ARGS="$BIND_ARGS --bind $HOME/.conda/pkgs:/opt/miniconda3/pkgs"
    echo "Detected conda-based container, enabling conda cache bind mount"
fi

APPTAINER_TMPDIR=$PWD apptainer build $BIND_ARGS "$1.sif" "$DEF_FILE"
