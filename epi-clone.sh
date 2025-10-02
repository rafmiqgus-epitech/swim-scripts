#!/bin/bash

POOL_DIR="" # METTEZ LE DOSSIER DE VOTRE PISCINE ICI (format : /home/<user>/... ou ~/...)


if [ -z "$POOL_DIR" ]; then
    echo "Error: POOL_DIR is not set or is empty."
    exit 1
fi

if [ ! -d "$POOL_DIR" ]; then
    echo "Error: POOL_DIR ($POOL_DIR) does not exist."
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage: epi-clone <github_repo_link>"
    exit 1
fi


GITHUB_LINK="$1"
REPO_DIR="$(basename -s .git "${GITHUB_LINK%/}")"


if [ "$(pwd)" != "$POOL_DIR" ]; then
    echo "Error: You must run this script from $POOL_DIR"
    exit 1
fi

if [ ! -f "$HOME/.ssh/id_rsa.pub" ] && [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo "Error: No SSH public key found in ~/.ssh"
    exit 1
fi

case "$1" in
    git@github.com:*.git) ;;
    *) echo "Error: Argument must be a valid GitHub SSH link (git@github.com:user/repo.git)"; exit 1 ;;
esac


git clone "$GITHUB_LINK"
if [ $? -ne 0 ]; then
    echo "Error: git clone failed"
    exit 1
fi


if [ -d "include" ]; then
    cp -r include "$REPO_DIR/"
    echo "Copied include/ into $REPO_DIR/"
else
    echo "Error: include/ directory not found in $(pwd)"
fi

if [ -f ".gitignore" ]; then
    cp .gitignore "$REPO_DIR/"
    echo "Copied .gitignore into $REPO_DIR/"
else
    echo "Error: .gitignore not found in $(pwd)"
fi

if [ -d "lib" ]; then
    cp -r lib "$REPO_DIR/"
    echo "Copied lib/ into $REPO_DIR/"

    if [ -f "$REPO_DIR/lib/my/build.sh" ]; then
        echo "Found build.sh, executing it..."
        env -C "$REPO_DIR/lib/my" ./build.sh
        if [ $? -eq 0 ]; then
            echo "build.sh executed successfully."
        else
            echo "Error: build.sh failed."
        fi
    else
        echo "No build.sh found in $REPO_DIR/lib/my/"
    fi
else
    echo "Error: lib/ directory not found in $(pwd)"
fi

echo "Setup completed for $REPO_DIR."
