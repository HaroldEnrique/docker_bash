#!/bin/sh

command_exists() {
	command -v "$@" > /dev/null 2>&1
}


if command_exists docker; then
    docker_version="$(docker -v | cut -d ' ' -f3 | cut -d ',' -f1)"
    echo "docker version : $docker_version"
fi