#!/bin/bash

set -o xtrace

# Define variables.
BRANCH="master"
TMP_DIR=`mktemp -d -t composer-installer.XXXXXX`

# Fetch package list.
mkdir -p $HOME/.composer
curl -sL https://raw.githubusercontent.com/pantarei/composer-installer/$BRANCH/composer.json > $HOME/.composer/composer.json

# Install plugins.
composer global update

# Register the Drupal and DrupalPractice Standard with PHPCS:
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
