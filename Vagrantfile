Vagrant.configure("2") do |config|
  config.vm.define "test-node" do |node|
    node.vm.hostname = "test-node"
    node.vm.network "private_network", ip: "192.168.50.101"
    node.vm.box = "opscode-ubuntu-12.04-i386"
    node.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
    node.vm.provider "vmware_fusion" do |v, override|
      override.vm.box = "ubuntu-12.04.3-server-amd64"
    end    
  end
end