#!/bin/bash

# Print 256-color palette
for i in {0..255}; do
    printf "\e[38;5;${i}m%3d " "$i"
    # Format nicely into 16 columns
    if (( $i == 15 )) || (( $i > 15 )) && (( ($i-15) % 16 == 0 )); then
        echo
    fi
done

# Reset terminal colors to default
echo -e "\e[0m"

