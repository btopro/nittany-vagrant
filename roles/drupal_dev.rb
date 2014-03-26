name "drupal_dev"
description "Useful tools for Drupal developers."
run_list(
  "recipe[drupal::dev]",
  "recipe[drush::head]",
  "recipe[drush_make]"
)
