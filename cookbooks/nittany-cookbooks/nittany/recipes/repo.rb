# Author:: Bryan Ollendyke <bto108@psu.edu>
# Cookbook Name::  nittany
# Recipe:: repo
#
# Licensed under the GPL, Version 2.0
#

case node[:platform]
when "debian", "ubuntu"
  bash "update-nittany-repo" do
    code <<-EOH
    (cd /var/www/nittany
      git pull origin master)
    EOH
    only_if { File.exists?("/var/www/nittany") }
  end
end
