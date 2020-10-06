# !/bin/bash

option=""
optionRegex="^[1-2]{1}$"

command_exists() {
	command -v "$@" > /dev/null 2>&1
}



# Checking for Docker Engine
echo "========== CHECKING PREREQUISITES =========="
echo "Checking Docker installation"

if command_exists docker; then
    docker_version="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo -e "Docker version : $docker_version \n"

    echo "All the prerequisites are complete"

    echo -e "\n======= MENU ======"
    echo "1. Install Docker-Compose on Linux"
    echo "2. Uninstall Docker-Compose"
    echo "==================="
    echo -e "\n"
    read -p "Please enter a number from the above menu (1-2): " option
    echo -e "\n"

    if [[ $option =~ $optionRegex ]]; then
        option=$option
    else
        option="*"
    fi

    case "$option" in
        "1")
            echo -e "======== INSTALLING DOCKER-COMPOSE [2 STEPS] ========\n"
            
            # download the Docker Compose binary from the Compose repository release page on GitHub

            echo "[1/2 STEP] Downloading the current stable release of Docker Compose"
            sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

            echo -e "\n[2/2 STEP] Apply executable permissions to the binary"
            sudo chmod +x /usr/local/bin/docker-compose

            #echo -e "\nChecking docker-compose version:"
            #docker-compose --version

            echo -e "\n======== Yayyy! DOCKER-COMPOSE SET UP FINISHED ========\n"

            sleep 2;;
        "2")
            echo -e "======== UNINSTALLING DOCKER-COMPOSE [1 STEP] ========\n"
            
            # download the Docker Compose binary from the Compose repository release page on GitHub

            echo "[1/1 STEP] Uninstall docker-compose with curl"
            sudo rm /usr/local/bin/docker-compose

            echo -e "\n======== DOCKER-COMPOSE WAS UNINSTALLED ========\n"

            sleep 2;;
        "*") echo "Incorrect option, please be sure to type just a number";;
    esac

else
    echo -e "\nWARNING: Docker Engine is not installed, it is a prerequisite. Please visit Docker docs.\n"
fi



