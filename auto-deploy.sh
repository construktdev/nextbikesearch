#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "--- NextbikeSearch Deployment Script ---"

# 1. Detect Distribution and Install Dependencies
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Could not detect OS. Exiting."
    exit 1
fi

echo "Step #1: Installing tools for $OS..."

case "$OS" in
    ubuntu|debian|raspbian)
        sudo apt update
        sudo apt install -y git docker.io wget
        ;;
    fedora)
        sudo dnf install -y git docker wget
        ;;
    arch|cachyos)
        sudo pacman -Sy --noconfirm git docker wget
        ;;
    *)
        echo "Unsupported distribution: $OS"
        exit 1
        ;;
esac

# Start and enable Docker (so it survives a reboot)
sudo systemctl enable --now docker

# 2. User Input
read -p "Enter the host port (e.g., 8080): " port
read -p "Enter the container name: " name

# 3. Setup Workspace
echo "Step #2: Preparing Dockerfile..."
mkdir -p nextbikesearch
cd nextbikesearch

wget -q https://raw.githubusercontent.com/construktdev/nextbikesearch/refs/heads/main/Dockerfile -O ./Dockerfile

# 4. Build and Run
echo "Step #3: Building Docker Image..."
sudo docker build --tag construkter/nextbikesearch:latest .

echo "Step #4: Starting Container '$name' on port $port..."
# Check if a container with that name already exists and remove it to avoid errors
if [ "$(sudo docker ps -aq -f name=$name)" ]; then
    echo "Removing existing container with name $name..."
    sudo docker rm -f $name
fi

sudo docker run --detach --name "$name" --publish "$port":80 construkter/nextbikesearch:latest

echo "------------------------------------------------"
echo "DONE! Visit http://localhost:$port"
