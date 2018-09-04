#!/bin/sh

echo "Setting up SSH settings..."
echo "ssh -o StrictHostKeyChecking=no -i private \$@;" > ./sshOverride.sh
chmod 700 ./sshOverride.sh;

echo "Setting up SSH private key..."
echo -e "$SSH_PRIVATE_KEY" > private
chmod 600 private
echo "Setting up GIT settings..."
export GIT_SSH=./sshOverride.sh

echo "Cloning repository..."
git clone --depth=1 $REPOSITORY_URL /mnt/git

echo "Purging private key..."
rm -f private
