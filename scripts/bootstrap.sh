
#!/bin/bash
set -e

sudo apt update
sudo apt install -y curl git docker.io npm openssh-server htop net-tools

sudo systemctl enable ssh
sudo systemctl start ssh

sudo usermod -aG docker $USER

docker --version

