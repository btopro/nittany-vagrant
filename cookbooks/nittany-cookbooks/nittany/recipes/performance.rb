# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  nittany
# Recipe:: performance
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  # force some settings to be as such by writing to the end of those files
  bash "last-minute-config-tweaks" do
    code <<-EOH
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/php.txt >> /etc/php5/apache2/php.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/apc.txt >> /etc/php5/apache2/conf.d/apc.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/my.txt >> /etc/php5/apache2/conf.d/mysql.ini
    cat /tmp/vagrant-chef-1/chef-solo-3/cookbooks/nittany/files/default/my.txt >> /etc/php5/apache2/conf.d/mysqli.ini
    EOH
  end

end
