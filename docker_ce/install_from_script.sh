# !/bin/bash

echo -e "\n====== Installing Docker Engine ======\n"

echo "WARNING: Docker provides convenience scripts at get.docker.com and test.docker.com for installing edge and testing versions"
echo "WARNING: Using these scripts is not recommended for production environments, and you should understand the potential risks before you use them"

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo -e "\n====== INSTALL DOCKER ENGINE ENDED UP ======\n"

read -p "Do you wish to add your user to the “docker” group? y/n: " response
case $response in
    "y") 
        sudo usermod -aG docker $(whoami)
        echo "Added successfully";;
    "n") exit;;
esac

