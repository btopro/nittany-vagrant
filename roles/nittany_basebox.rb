name "nittany_basebox"
description "A base box for nittany to get up and developing quickly."
run_list(
  "role[apache2_mod_php]",
  "role[drupal]",
  "role[drupal_dev]",
  "recipe[nittany::performance]",
  "role[memcached]",
  "role[mysql_server]",
  "recipe[drupal::multisite]",
  "recipe[nittany::default]",
  "recipe[nittany::install]"
)
