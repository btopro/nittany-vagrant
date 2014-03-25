# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  nittany
# Recipe:: default
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  git "/var/www/nittany" do
    repository "git://github.com/btopro/nittany.git"
    reference "master"
    action :sync
  end
  # make a shortcut in home directory to nittany instance
  bash "make-nittany-symlink" do
    code <<-EOH
    (ln -s /var/www/nittany /home/vagrant/nittany)
    EOH
    not_if { File.exists?("/home/vagrant/nittany") }
    only_if { File.exists?("/var/www/nittany") }
  end
end
