#! /usr/bin/env bash

read -r PROG_DIR < <(
    cd "${0%/*}" && pwd
)

docker build \
    --build-arg "USER=$USER" \
    --build-arg "UID=$(id -u "$USER")" \
    --build-arg "GROUP=$(id -gn "$USER")" \
    --build-arg "GID=$(id -g "$USER")" \
    --build-arg "LOCALES=en_US.utf8 it_IT.utf8" \
    --network host \
    --tag "masavini/glabels:3.2.1-amd64" \
    "${PROG_DIR}"
