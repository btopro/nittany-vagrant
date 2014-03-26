Nittany Vagrant package
==============
[Watch how to use this!](https://www.youtube.com/watch?v=ZeuDKzs6sj0&list=PLJQupiji7J5fygec37Wd-gAbpMj8c5A_C)
###What is this
This is a Vagrant profile for installing a fully functioning [Nittany distribution](https://github.com/btopro/nittany) in a single command!  This instance is purely for development purposes and streamlining collaboration between drupal users.  It is not specific to Penn State but provides a lot of best practices in drupal site development.

###How to use this to bring up Nittany
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (ensure you are on the latest version 4.0.8+)
2. Install [Vagrant](http://www.vagrantup.com/downloads.html)
3. Install [git](http://git-scm.com/downloads) (recommended)
4. Download or Clone (`git clone https://github.com/btopro/nittany-vagrant.git`) this project
5. Add this line to your /etc/hosts (or [windows equivalent](http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)) so you can access it "over the web":
```
###Nittany development

# front facing addresses
10.0.18.55       dev.nittany.local
```

###Spin up the vagrant instance:
```
cd nittany-vagrant
vagrant up
```

Go to http://dev.nittany.local/ after installation completes (grab a coffee, it takes awhile the first time to finish).  If it all worked you should see a new Drupal site running the Nittany distribution.

You can log into this with `user: admin | password: admin`

To connect to the console of your instance: `vagrant ssh`

###Why use this

This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.  It has been optimized and heavily tested for use with ELMS Learning Network (which this package is forked from). This is the recommended package for Drupal development by the Penn State Drupal Users Group.

###Other projects of interest / that this is based on
*  [https://github.com/btopro/elmsln-vagrant](https://github.com/btopro/elmsln-vagrant)
*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
