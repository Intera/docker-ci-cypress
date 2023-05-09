#!/bin/bash

set -e

cd "$HOME"

npm install "cypress@${CYPRESS_VERSION}"

npx cypress verify
