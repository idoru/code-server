#!/usr/bin/env bash

set -exuo pipefail

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list

sudo apt-get update
sudo apt-get install \
	nfpm \
	nodejs \
	git-lfs \
	gnupg \
	quilt \
	rsync \
	unzip \
	build-essential \
	g++ \
	libx11-dev \
	libxkbfile-dev \
	libsecret-1-dev \
	libkrb5-dev \
	python-is-python3 \
	jq \
	-y

sudo npm install --global yarn


### Following development workflow
git submodule update --init
quilt push -a
yarn
