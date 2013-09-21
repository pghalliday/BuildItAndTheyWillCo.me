BuildItAndTheyWillCo.me
=======================

Let's build something that has no purpose except to be built and document the journey

Prerequisites
-------------

- Sign up for enterprise chef
- Create an organization
- Download the organization validator key file and place in `.chef`
- Download the organization 'knife.rb' file and place in `.chef`
- Download your user key file and place in `.chef`
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://downloads.vagrantup.com/)
- [XQuartz](http://xquartz.macosforge.org/landing/) (on OSX) for X11 forwarding
- The Vagrant bindler plugin

```
vagrant plugin install bindler
vagrant bindler setup
```

- Other vagrant plugins

```
vagrant plugin bundle
```

Usage
-----

```
vagrant up
vagrant ssh
```

See Vagrant [documentation](http://docs.vagrantup.com/v2/) if you need to know more about Vagrant


Done
----

- Register Domain Name
  - builditandtheywillco.me
- Blog about my intent
  - http://stuffpetedoes.blogspot.nl/2013/09/aws-revisited-birth-of.html
- Create GitHub Repository
  - https://github.com/pghalliday/BuildItAndTheyWillCo.me
- Start Todo list
- Configure a new organization in chef enterprise
  - builditandtheywillcome

Todo
----

- Set up chef workstation environment with vagrant
- Migrate to amazon route 53 for DNS management
- Automate deployment
  - Create recipes to deploy to EC2
  - Automate DNS configuration
  - Deploy some blogging software
    - Wordpress?
