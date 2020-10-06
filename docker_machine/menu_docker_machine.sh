# !/bin/bash

option=""
optionRegex="^[1-2]{1}$"


# Checking for Docker Engine
command_exists() {
	command -v "$@" > /dev/null 2>&1
}

if command_exists docker; then
    docker_version="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo "Docker version : $docker_version"

    echo "All the prerequisites are complete"

    echo -e "\n======= MENU ======"
    echo "1. Install Docker-Machine on Linux"
    echo "2. Uninstall Docker-Machine"
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
            echo -e "======== INSTALLING DOCKER-MACHINE [1 STEP] ========\n"

            echo "[1/1 STEP] Downloading the Docker Machine binary and extracting it to your PATH"

            base=https://github.com/docker/machine/releases/download/v0.16.0
            curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine
            chmod +x /usr/local/bin/docker-machine

            echo -e "\nChecking docker-machine version:"
            docker-machine version --version

            echo -e "\n======== Yayyy! DOCKER-FINISHED SET UP FINISHED ========\n"

            sleep 2;;
        "2")
            echo -e "======== UNINSTALLING DOCKER-MACHINE [1 STEP] ========\n"
            
            echo "[1/1 STEP] Removing the executable"
            sudo rm $(which docker-machine)

            echo -e "\n======== DOCKER-MACHINE WAS REMOVED ========\n"

            sleep 2;;
        "*") echo "Incorrect option, please be sure to type just a number";;
    esac

else

    echo -e "\nWARNING: Docker Engine is not installed, it is a prerequisite. Please visit Docker for Linux docs.\n"
fi

