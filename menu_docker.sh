# !/bin/bash

SCRIPT_PATH_DOCKER_ENGINE="./docker_ce/menu_docker_engine.sh"
SCRIPT_PATH_DOCKER_COMPOSE="./docker_compose/menu_docker_compose.sh"
SCRIPT_PATH_DOCKER_MACHINE="./docker_machine/menu_docker_machine.sh"

option=""
optionRegex="^[1-4]{1}$"



# CHECKING FOR PRIOR INSTALLATIONS OF DOCKER-CE, DOCKER-COMPOSE OR DOCKER-MACHINE
echo "Checking for prior installtions of docker-ce, docker-compose and docker-machine\n"

validator=""

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

if command_exists docker; then
    docker_version="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo "[1] Docker-ce is installed, version : $docker_version"
else
    echo "[1] Docker-ce is not installed."
fi

if command_exists docker-compose; then
    docker_compose_version="$(docker-compose -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo "[2] Docker-compose is installed, version : $docker_compose_version"
else
    echo "[1] Docker-compose is not installed."
fi

if command_exists docker-machine; then
    docker_machine_version="$(docker-machine -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo "[2] Docker-machine is installed, version : $docker_machine_version"
else
    echo "[1] Docker-machine is not installed."
fi



while true
do
    echo -e "\n======= MENU ======"
    echo "1. Install/Uninstall Docker-Engine"
    echo "2. Install/Uninstall Docker-Machine"
    echo "3. Install/Uninstall Docker-Compose"
    echo "4. Exit"
    echo "==================="
    echo -e "\n"
    read -p "Please enter a number from the above menu (1-4): " option
    echo -e "\n"

    if [[ $option =~ $optionRegex ]]; then
         option=$option
    else
         option="*"
    fi

    case "$option" in
        "1")
            echo "You chose to install docker-engine"
            echo ".........."
            bash "$SCRIPT_PATH_DOCKER_ENGINE"
            sleep 2;;
        "2")
            echo "You chose to install docker-compose"
            echo ".........."
            bash "$SCRIPT_PATH_DOCKER_COMPOSE"
            sleep 2;;
        "3")
            echo "You chose to install docker-machine"
            echo ".........."
            bash "$SCRIPT_PATH_DOCKER_MACHINE"
            sleep 2;;
        "4")
            echo -e "It was a pleasure for having you here. Come back soon.\n"
            exit 0;;
        "*") echo "Incorrect option, please be sure to type just a number in the valid range (1-7)";;
    esac
done
echo "That's all!"