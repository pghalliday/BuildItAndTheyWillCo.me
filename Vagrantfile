Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true

  config.vm.define "knife" do |node|
    node.omnibus.chef_version = :latest
    node.vm.box = "precise-server-cloudimg-amd64"
    node.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    node.vm.hostname = "knife"
    node.vm.provision :chef_solo do |chef|
      chef.run_list = [
        "recipe[git]"
      ]
    end
  end

  config.vm.define "node-0" do |node|
    node.vm.box = "opscode-ubuntu-12.04-i386"
    node.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
    node.vm.hostname = "node-0"
  end
end