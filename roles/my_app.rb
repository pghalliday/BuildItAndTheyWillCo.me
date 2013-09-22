name 'my_app'
description 'A single application server'
run_list(
  'recipe[git]',
  'recipe[mysql::server]',
  'recipe[mysql::client]',
  'recipe[mysql::ruby]',
  'recipe[apache2]',
  'recipe[passenger_apache2]',
  'recipe[passenger_apache2::mod_rails]',
  'recipe[my_app]'
)
