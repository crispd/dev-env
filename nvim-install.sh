#!/bin/bash

# If no plugins were passed, default to installing a basic set in order
if [ $# -eq 0 ]; then
  set -- nvim
fi

# Run all of the indicated plugins
for i; do
  echo "########## Installing ${i} ##########"
  source "$(dirname "$0")/${i}/install.sh"
done

