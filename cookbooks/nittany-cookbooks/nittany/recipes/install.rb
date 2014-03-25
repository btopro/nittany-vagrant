# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  nittany
# Recipe:: install
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  bash "install-nittany-script" do
    code <<-EOH
    (
    cd /var/www/nittany
    drush site-install nittany -y --db-url=mysql://root:n3I7z0HAYV689Z2541mF@localhost/nittany_dev --db-su=root --db-su-pw=n3I7z0HAYV689Z2541mF  --account-mail="admin@dev.nittany.local" --site-mail="admin@dev.nittany.local" --site-name="Nittany"
    #modify ownership of these directories
    chown -R www-data:www-data /var/www/nittany/default/files
    chmod -R 755 /var/www/nittany/default/files
    # setup private file directory
    mkdir -p /var/www/nittany_priv
    chown -R www-data:www-data /var/www/nittany_priv
    chmod -R 755 /var/www/nittany_priv
    drush -y --uri=http://dev.nittany.local upwd admin --password=admin
    )
    EOH
    only_if { File.exists?("/var/www/nittany/index.php") }
    not_if { File.exists?("/var/www/nittany/sites/default/settings.php") }
  end
end