#!/bin/bash

# check if `config.toml` exists
if [ ! -f ./config.toml ]; then
    echo "[deploy.sh]config.toml doesn't exist"
    exit
fi

# replacing url to $1
echo -e "\033[0;32mURL Replacing\n\033[0m"
sed -i "s|^baseURL = .*\"|baseURL = \"$1\"|" config.toml
