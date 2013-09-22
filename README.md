BuildItAndTheyWillCo.me
=======================

Let's build something that has no purpose except to be built and document the journey

Prerequisites
-------------

- Sign up for [Enterprise Chef](https://www.opscode.com/)
- Create an organization
- Download the organization validator key file and place in `.chef`
- Download the organization 'knife.rb' file and place in `.chef`
- Download your user key file and place in `.chef`
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://downloads.vagrantup.com/)
- The Vagrant bindler plugin

```
vagrant plugin install bindler
vagrant bindler setup
```

Usage
-----

To start a test node to converge

```
vagrant up
```

The node will be started with a host only IP address 192.168.50.101
To create a knife environment using Vagrant from the `knife` directory

```
cd knife
vagrant plugin bundle
vagrant up
vagrant ssh
```

The knife VM will be started with a host only IP address 192.168.50.100. It will be possible to converge the test node on IP 192.168.50.101

```
cd /chef-repo
knife bootstrap 192.168.50.101 \
  --ssh-user vagrant \
  --ssh-password vagrant \
  --run-list "recipe[apt],recipe[aliases],recipe[apache2]" \
  --sudo
```

See Vagrant [documentation](http://docs.vagrantup.com/v2/) if you need to know more about Vagrant

Roadmap
-------
 
### Done

- Register Domain Name
  - builditandtheywillco.me
- Blog about my intent
  - http://stuffpetedoes.blogspot.nl/2013/09/aws-revisited-birth-of.html
- Create GitHub Repository
  - https://github.com/pghalliday/BuildItAndTheyWillCo.me
- Start Todo list
- Configure a new organization in chef enterprise
  - builditandtheywillcome
- Set up chef workstation environment with vagrant

### Todo

- Integrate with AWS/EC2
- Migrate to amazon route 53 for DNS management
- Automate deployment
  - Create recipes to deploy to EC2
  - Automate DNS configuration
  - Deploy some blogging software
    - Wordpress?
