#! /usr/bin/env bash

read -r PROG_DIR < <(
    cd "${0%/*}" && pwd
)

BIN_DIR="/usr/local/bin"

cd "${BIN_DIR}" || exit 1
sudo rm -f "${BIN_DIR}/glabels" "${BIN_DIR}/glabels-batch"

sudo ln -s "${PROG_DIR}/glabels" .
sudo ln -s "${PROG_DIR}/glabels-batch" .

cd "${PROG_DIR}" || exit 1

sudo cp glabels.desktop /usr/share/applications/

sudo mkdir -p /usr/share/pixmaps
sudo cp glabels.xpm /usr/share/pixmaps/
