#!/bin/bash

set -o xtrace

# Define variables.
BRANCH="master"
TMP_DIR=`mktemp -d -t composer-installer.XXXXXX`

# Install composer locally.
mkdir -p $TMP_DIR
curl -sS https://getcomposer.org/installer | php -- --install-dir=$TMP_DIR

mkdir -p $HOME/bin
mv $TMP_DIR/composer.phar $HOME/bin/composer

export PATH=$HOME/bin:$PATH
composer selfupdate

# Fetch package list.
mkdir -p $HOME/.composer
curl -sL https://raw.githubusercontent.com/pantarei/composer-installer/$BRANCH/composer.json > $HOME/.composer/composer.json

# Install plugins.
composer global update
