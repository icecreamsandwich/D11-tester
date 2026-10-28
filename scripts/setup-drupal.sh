#!/usr/bin/env bash
set -euo pipefail

Add common contributed modules.
ddev composer require \
  drupal/token \
  drupal/pathauto \
  drupal/metatag \
  drupal/redirect \
  drupal/honeypot \
  drupal/seckit \
  drupal/devel \
  drupal/simple_sitemap

# Enable contributed modules.
ddev drush pm:enable \
  admin_toolbar_tools \
  token \
  pathauto \
  metatag \
  redirect \
  honeypot \
  seckit \
  devel \
  simple_sitemap \
  --yes

# Enable useful Drupal core modules.
ddev drush pm:enable \
  media \
  media_library \
  layout_builder \
  --yes

# Rebuild caches and fetch update data.
ddev drush cr
ddev drush cron
ddev drush updb --yes
ddev drush cr

# Site studio installation
ddev composer require \
  acquia/cohesion:^8.0 \
  acquia/cohesion-theme:^8.0 \
  --with-all-dependencies


# Enable Site Studio and required modules.
ddev drush pm:enable \
  cohesion \
  cohesion_base_styles \
  cohesion_custom_styles \
  cohesion_elements \
  cohesion_style_helpers \
  cohesion_sync \
  cohesion_templates \
  cohesion_website_settings \
  --yes

ddev drush cr