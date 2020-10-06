# !/bin/bash

echo -e "\n====== Installing Docker Engine ======\n"

# uninstall old versions
echo "[Uninstall old versions]"
sudo apt-get remove docker docker-engine docker.io containerd runc

# install using the repository
# set up the repository

echo -e "\n====== SET UP THE REPOSITORY (3 STEPS)======"

# update apt package and install others
echo -e "\n[STEP 1/3]\n"
sudo apt-get update

sudo apt-get install \
    apt-transport-https -y\
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker's official gpg key
echo -e "\n[STEP 2/3]\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88


# set up the stable repository
echo -e "\n[STEP 3/3]\n"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo -e "\n====== INSTALL DOCKER ENGINE ======\n"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

docker --version

echo -e "\n====== INSTALL DOCKER ENGINE ENDED UP ======\n"


read -p "Do you wish to add your user to the “docker” group? y/n: " response
case $response in
    "y") 
        sudo usermod -aG docker $(whoami)
        echo "Added successfully";;
    "n") exit;;
esac