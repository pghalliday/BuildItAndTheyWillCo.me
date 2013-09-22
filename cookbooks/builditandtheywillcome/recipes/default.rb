#
# Cookbook Name:: builditandtheywillcome
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "wordpress::default"
include_recipe "route53"

route53_access = search(:route53, "id:access").first

route53_record "create CNAME record" do
  name  "*"
  value node[:ec2][:public_hostname]
  type  "CNAME"

  zone_id               route53_access[:zone_id]
  aws_access_key_id     route53_access[:aws_access_key_id]
  aws_secret_access_key route53_access[:aws_secret_access_key]

  action :create
end