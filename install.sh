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

# Install PHPUnit
curl -sL https://phar.phpunit.de/phpunit-6.0.phar > /usr/local/bin/phpunit
chmod a+x /usr/local/bin/phpunit

# Install PHP_CodeSniffer
curl -sL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar > /usr/local/bin/phpcs
chmod a+x /usr/local/bin/phpcs
curl -sL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar > /usr/local/bin/phpcbf
chmod a+x /usr/local/bin/phpcbf

# Install PHP Coding Standards Fixer
curl -sL https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v1.12.3/php-cs-fixer.phar > /usr/local/bin/php-cs-fixer
chmod a+x /usr/local/bin/php-cs-fixer

# Install Sami
curl -sL http://get.sensiolabs.org/sami.phar > /usr/local/bin/sami
chmod a+x /usr/local/bin/sami

# Install Drush
curl -sL https://s3.amazonaws.com/files.drush.org/drush.phar > /usr/local/bin/drush
chmod a+x /usr/local/bin/drush

# Install Drupal Console
curl -sL https://drupalconsole.com/installer > /usr/local/bin/drupal
chmod a+x /usr/local/bin/drupal

# Register the Drupal and DrupalPractice Standard with PHPCS:
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
