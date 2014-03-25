# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # private network port maping, host files point to this domain
  config.vm.network "private_network", ip: "10.0.18.55"

  config.vm.network "forwarded_port", guest: 80, host: 1855
  config.vm.network "forwarded_port", guest: 3306, host: 3305

  # mount directory
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.memory = 512
    v.cpus = 1
  end

  config.vm.provision "chef_solo" do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks", "cookbooks/nittany-cookbooks"]

    chef.add_recipe("vim")

    chef.roles_path = "roles"

    # This role represents our default Nittany development stack.
    chef.add_role("nittany_basebox")

    chef.json.merge!({
      :www_root => '/var/www/nittany',
      :mysql => {
        :server_root_password => "n3I7z0HAYV689Z2541mF",
        :allow_remote_root => true,
        :bind_address => "0.0.18.55"
      },
      :hosts => {
        :localhost_aliases => ["dev"]
      },
      :drush => {
        :install_method => 'pear',
        :version => '6.2.0'
      }
    })
  end
  config.vm.provision "shell",
    inline: "echo 'finished! go to http://dev.nittany.local/ and login with username admin and password admin'"
end

# Returns true if we are running on a MS windows platform, false otherwise.
def Kernel.is_windows?
  processor, platform, *rest = RUBY_PLATFORM.split("-")
  platform == 'mswin32' || platform == 'mswin64' || platform == 'mingw32' || platform == 'mingw32'
end
