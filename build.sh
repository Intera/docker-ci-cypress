#!/usr/bin/env bash
set -e

cypressVersion="$1"
nodeVersion="$2"

echo "Building for Cypress version ${cypressVersion}"

# Update package lists and bring all package up to date.
apt-get update
apt-get dist-upgrade -y

# Install dependencies for install scripts.
apt-get install -y \
	apt-transport-https \
	curl \
	gnupg

# Install Node.js
curl -sL "https://deb.nodesource.com/setup_${nodeVersion}.x" | bash -
apt-get install -y nodejs

# Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y yarn

# Install Cypress dependencies
apt-get install -y \
	libgtk2.0-0 \
	libgtk-3-0 \
	libgbm-dev \
	libnotify-dev \
	libgconf-2-4 \
	libnss3 \
	libxss1 \
	libasound2 \
	libxtst6 \
	xauth \
	xvfb

# Download Cypress binary
mkdir /opt/cypress
curl -sS "https://cdn.cypress.io/desktop/${cypressVersion}/linux64/cypress.zip" >/opt/cypress/cypress.zip

# Cleanup
apt-get purge -y \
	apt-transport-https \
	curl \
	gnupg \
	lsb-release
apt-get --purge -y autoremove
apt-get autoclean
apt-get clean
rm -rf /var/lib/apt/lists/*
