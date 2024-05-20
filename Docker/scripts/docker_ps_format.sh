#!/bin/bash

# Define colors using tput
bold=$(tput bold)
normal=$(tput sgr0)
yellow=$(tput setaf 3)

# Print the heading with colors
printf "${bold}${yellow}%-20s %-30s %-20s %-30s${normal}\n" "CONTAINER ID" "IMAGE" "STATUS" "PORTS"

# Print the docker ps output in the desired format
docker ps -a --format " {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" | awk -F'\t' '{printf "%-20s %-30s %-20s %-30s\n", $1, $2, $4, $5}'

