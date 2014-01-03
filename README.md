chef-repo
=========

Nginx, rbenv, MongoDB

Requirements
============
Bundler
Vagrant 1.4.0

Order
=====

    cd chef-repo
    bundle install
    bundle exec berks install
    vagrant up
    vagrant ssh-config --host vagrant >> ~/.ssh/config
