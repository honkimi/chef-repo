# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
  config.vm.box = "base"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.ssh.forward_agent = true
  config.vm.synced_folder "./shared_data", "/vagrant_data"

  config.berkshelf.enabled = false

  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.json = {
      nginx: {
        version: "1.5.8",
        dir:     "/usr/local/nginx",
        log_dir: "/var/log/nginx"
      },
      mongodb: {
        dbpath:       "/data/db/",
        port:         27017,
        logpath:      "/var/log/mongodb",
        package_name: "mongo-10gen-server"
      }
    }

    chef.add_recipe "myrecipe::build-essential"
    chef.add_recipe "simple_iptables"
    chef.add_recipe "myrecipe::iptables"
    chef.add_recipe "nginx::source"
    chef.add_recipe "myrecipe::rbenv"
    chef.add_recipe "mongodb::10gen_repo"
    chef.add_recipe "mongodb"
    chef.add_recipe "myrecipe::app_env"
  end
end
