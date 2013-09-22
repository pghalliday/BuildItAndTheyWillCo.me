BuildItAndTheyWillCo.me
=======================

Let's build something that has no purpose except to be built and document the journey

Prerequisites
-------------

- Sign up for [Enterprise Chef](https://www.opscode.com/)
- Create an organization
- Download the organization validator key file and place in `.chef`
- Download the organization `knife.rb` file and place in `.chef`
- Download your user key file and place in `.chef`
- Create a Route53 zone for the domain
- Create an EC2 key pair called `chef-EC2` and download `chef-EC2.pem`
- Place the `chef-EC2.pem` key file in `.chef`
- Create an IAM user and download the access key ID and secret access key
- Configure the AWS and EC2 parameters in `knife.rb`

```ruby
# knife.rb

knife[:aws_access_key_id] = 'ACCESS_KEY_ID'
knife[:aws_ssh_key_id] = 'chef-EC2'
knife[:aws_secret_access_key] = 'SECRET_ACCESS_KEY'
```

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://downloads.vagrantup.com/)
- The Vagrant bindler plugin

```
vagrant plugin install bindler
vagrant bindler setup
```

Usage
-----

Create a knife environment using Vagrant from the `knife` directory.

```
cd knife
vagrant plugin bundle
vagrant up
vagrant ssh
```

Install Berkshelf and the EC2 plugin, download the community cookbooks and upload them to the server.

```
cd /chef-repo
bundle install
bundle exec berks
bundle exec berks upload
```

Upload the roles

```
knife role from file roles/builditandtheywillcome.rb
```

Create a data bag for AWS Route 53 access keys

```
knife data bag create route53 access
```

When prompted add the following data item

```json
{
  "id": "access",
  "zone_id": "ZONE_ID",
  "aws_access_key_id": "ACCESS_KEY_ID",
  "aws_secret_access_key": "SECRET_ACCESS_KEY"
}
```

Create the EC2 server (we use bundle exec so that ruby can find the EC2 plugin).

```
bundle exec knife ec2 server create \
  --availability-zone us-east-1c \
  --node-name wordpress.builditandtheywillco.me \
  --flavor t1.micro \
  --image ami-fd20ad94 \
  --identity-file .chef/chef-EC2.pem \
  --run-list "role[builditandtheywillcome]" \
  --ssh-user ubuntu
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
- Integrate with AWS/EC2

### Todo

- Create recipe for blog?
- Migrate to amazon route 53 for DNS management
- Automate deployment
  - Create recipes to deploy to EC2
  - Automate DNS configuration
  - Deploy some blogging software
    - Wordpress?
