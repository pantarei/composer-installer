#!/bin/bash

set -o xtrace

# Define variables.
BRANCH="master"
TMP_DIR=`mktemp -d -t composer-installer.XXXXXX`

# Install plugins.
composer self-update
composer global require --no-update consolidation/cgr:@stable
composer global require --no-update hirak/prestissimo:@stable
composer global update
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Install packages.
cgr drupal/coder              ~8.0
cgr drupal/console            ~1.0.0-rc19 --stability RC
cgr drush/drush               ~8.0
cgr friendsofphp/php-cs-fixer ~2.3
cgr phpunit/phpunit           ~5.7
cgr sami/sami                 ~4.0
cgr satooshi/php-coveralls    ~1.0
cgr squizlabs/php_codesniffer ~3.0

# Update packages.
cgr update

# Register the Drupal and DrupalPractice Standard with PHPCS:
phpcs --config-set installed_paths ~/.composer/global/drupal/coder/vendor/drupal/coder/coder_sniffer
