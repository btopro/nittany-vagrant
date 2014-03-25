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
    cd /var/www/nittany
    chown -R vagrant:vagrant /var/www/nittany
    drush site-install nittany -y --db-url=mysql://root:n3I7z0HAYV689Z2541mF@localhost/nittany_dev --db-su=root --db-su-pw=n3I7z0HAYV689Z2541mF  --account-mail="admin@dev.nittany.local" --site-mail="admin@dev.nittany.local" --site-name="Nittany"
    #modify ownership of these directories
    chown -R www-data:www-data /var/www/nittany/sites/default/files
    chmod -R 755 /var/www/nittany/sites/default/files
    # setup private file directory
    mkdir -p /var/nittany_priv
    chown -R www-data:www-data /var/nittany_priv
    chmod -R 755 /var/nittany_priv
    drush -y --uri=http://dev.nittany.local upwd admin --password=admin
    drush -y --uri=http://dev.nittany.local vset file_private_path "/var/nittany_priv"
    drush -y --uri=http://dev.nittany.local vset site_frontpage "user/login"
    drush dl drush_ecl registry_rebuild --y
    drush cc drush
    EOH
    only_if { File.exists?("/var/www/nittany/index.php") }
    not_if { File.exists?("/var/www/nittany/sites/default/settings.php") }
  end
   # shortcut for drs and other developer shorthand for root and vagrant
  bash "alias-shortcuts" do
    code <<-EOH
    printf "alias d='drush'\n" >> /home/vagrant/.bashrc
    printf "alias g='git'\n" >> /home/vagrant/.bashrc
    printf "alias l='ls -lah'\n\n" >> /home/vagrant/.bashrc
    printf "alias d='drush'\n" >> /root/.bashrc
    printf "alias g='git'\n" >> /root/.bashrc
    printf "alias l='ls -lah'\n\n" >> /root/.bashrc
    ln -s /var/www/nittany /root/nittany
    EOH
  end
  # force some settings to be as such by writing to the end of those files
  bash "last-minute-config-tweaks" do
    code <<-EOH
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/php.txt >> /etc/php5/apache2/php.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/apc.txt >> /etc/php5/apache2/conf.d/apc.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/my.txt >> /etc/php5/apache2/conf.d/mysql.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/my.txt >> /etc/php5/apache2/conf.d/mysqli.ini
    apachectl -k restart
    EOH
  end
end
