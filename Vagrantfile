# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
#  config.vm.box = "base"
  #Deploy Lab Box:
  config.vm.define "node01" do |node01|
    node01.vm.box = "ubuntu/xenial64"
    node01.vm.hostname = 'node01'
    node01.vm.network :forwarded_port, guest: 22, host: 2022, id: "ssh"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  #TODO: Version Packages
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    #TODO: experiment with uninstalling openssl,
    apt-get install -y git build-essential python2.7 python-simplejson python-pip openssl libssl-dev ca-certificates apt-transport-https curl
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
    apt-get update
    apt-get install -y docker-ce=17.06.2~ce-0~ubuntu
    #apt-get install -y docker-compose=1.8.0-2~16.04.1
    pip install --upgrade pip
    pip install docker-compose==1.13.0
    pip install ansible==2.3.2
    pip install ansible-container[docker,k8s,openshift]==0.9.2
    usermod -aG docker ubuntu
    #Un-Comment this to Install the Google Cloud SDK
    # export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
    # echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    # curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    # apt-get update && sudo apt-get install -y google-cloud-sdk
  SHELL
end
