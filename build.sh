#!/usr/bin/env bash

set -e

cypressVersion="$1"

echo "Building for Cypress version ${cypressVersion}"

# Update package lists and bring all package up to date.
apt-get update
apt-get dist-upgrade -y

# Install dependencies for install scripts.
apt-get install -y \
    curl

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
curl -sS "https://cdn.cypress.io/desktop/${cypressVersion}/linux-x64/cypress.zip" >/opt/cypress/cypress.zip

# Cleanup
apt-get purge -y \
    curl
apt-get --purge -y autoremove
apt-get autoclean
apt-get clean
rm -rf /var/lib/apt/lists/*
