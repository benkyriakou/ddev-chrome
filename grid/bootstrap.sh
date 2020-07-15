#! /bin/bash

set -o nounset -o pipefail

mkdir grid-project
cd grid-project
ddev config --project-type=drupal8 --docroot=web --create-docroot
ddev start

# This bit helpfully falls over. Apparently it also doesn't recognise --no-interaction.
ddev composer create --no-interaction "drupal/recommended-project:^8"

cp ../../config/docker-compose.chrome-standalone.yml .ddev/docker-compose.chrome.yml
ddev restart
ddev composer require --dev drush/drush drupal/drupal-extension dmore/behat-chrome-extension bex/behat-screenshot
ddev exec drush si -y
ddev exec "cd /var/www/html && ./vendor/bin/behat --init"
cp ../../features/* features/
cp -R ../../features/files features
mkdir screenshots

cp ../../config/behat-grid.yml behat.yml
ddev exec "cd /var/www/html && ./vendor/bin/behat"
