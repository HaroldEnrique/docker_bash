# !/bin/bash

option=""
optionRegex="^[1-4]{1}$"

SCRIPT_INSTALL_FROM_REPOSITORY="./docker_ce/install_from_repository.sh"
SCRIPT_INSTALL_FROM_SCRIPT="./docker_ce/install_from_script.sh"

SCRIPT_UNINSTALL_DOCKER_ENGINE="./uninstall.sh"

echo -e "\n======= MENU ======"
echo "1. Install using the repository"
echo "2. Install from a package (w)"
echo "3. Install using the convenience script"
echo "4. Uninstall docker engine"
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
        echo "You chose: 'Install using the repository'"
        echo ".........."
        bash "$SCRIPT_INSTALL_FROM_REPOSITORY"
        sleep 2;;
    "2")
        echo "You chose: 'Install from a package'"
        echo ".........."
        echo "Sorry, we're working on it, it'll be availabe soon."
        sleep 2;;
    "3")
        echo "You chose: 'Install using the convenience script'"
        echo ".........."
        bash "$SCRIPT_INSTALL_FROM_SCRIPT"
        sleep 2;;
    "4")
        echo "You chose: 'Uninstall docker engine'"
        echo ".........."
        bash "$SCRIPT_UNINSTALL_DOCKER_ENGINE"
        sleep 2;;
    "*") echo "Incorrect option, please be sure to type just a number";;
esac