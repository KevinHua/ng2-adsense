#!/usr/bin/env bash
set -exu

# Stages a release by putting everything that should be packaged and released
# into the ./deploy folder. This script should be run from the root of the project

# Clear dist/ and deploy/ so that we guarantee there are no stale artifacts.
rm -rf dist
rm -rf deploy

# compile src directory and create d.ts files
./node_modules/.bin/ngc -p ./src/lib/tsconfig.json -d

# copy root readme and license to deployment folder
cp README.md ./deploy
cp LICENSE ./deploy

# copy package.json files that are in lib folders
# find src/lib -name 'package.json' -type f -exec cp {} ./deploy \;
cp ./src/lib/package.json ./deploy
