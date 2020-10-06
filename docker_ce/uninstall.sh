# !/bin/bash

echo -e "\n====== Uninstalling Docker Engine ======\n"

echo "Uninstall the Docker Engine, CLI, and Containerd packages"
sudo apt-get purge docker-ce docker-ce-cli containerd.io

echo "Deleting all images, containers, and volumes"
sudo rm -rf /var/lib/docker

echo -e "\n====== Uninstalling Docker Engine ended up ======\n"
