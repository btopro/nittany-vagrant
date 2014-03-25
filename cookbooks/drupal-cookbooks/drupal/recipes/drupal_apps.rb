# Automatically prepare vhosts for drupal sites.
include_recipe "hosts"
include_recipe "apache2"

if node[:hosts].has_key(:localhost_aliases)
  node[:hosts][:localhost_aliases].each do |site|
    # Configure the development site
    web_app site do
      template "sites.conf.erb"
      server_name site + ".nittany.local"
      server_aliases [site + ".nittany.local"]
      docroot "#{node[:www_root]}" + '/' + site
    end
  end
end
