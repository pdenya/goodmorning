#!/bin/bash

# Path to .zshrc
ZSHRC="$HOME/.zshrc"

# Get the current directory
SCRIPT_DIR="$(pwd)"

# Alias to add (cd to directory first, then run script)
ALIAS="alias good=\"cd $SCRIPT_DIR && ./good_morning.sh\""

# Check if alias already exists
if grep -q "alias good=" "$ZSHRC" 2>/dev/null; then
    echo "Alias 'good' already exists in .zshrc"
    exit 0
fi

# Add alias to .zshrc
echo "" >> "$ZSHRC"
echo "# Good Morning script alias" >> "$ZSHRC"
echo "$ALIAS" >> "$ZSHRC"

echo "Alias added!"
echo "In a new terminal tab, type: good morning"
