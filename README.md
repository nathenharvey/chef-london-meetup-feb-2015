# Chef Provisioning

## Setup

1. Install ChefDK

        $ chef --version
        Chef Development Kit Version: 0.4.0

1. Download the httpd cookbook

        $ knife cookbook site download httpd
        Downloading httpd from the cookbooks site at version 0.2.6 to /Users/nathenharvey/chef_london_users/chef-repo/httpd-0.2.6.tar.gz
        Cookbook saved: /Users/nathenharvey/chef_london_users/chef-repo/httpd-0.2.6.tar.gz

1. Unzip the cookbook

        $ tar xzvf httpd-0.2.6.tar.gz -C cookbooks/

1.  Create the hello_world cookbook

        $ chef generate cookbook hello_world


1. Install knife-ec2 gem

        $ chef gem install knife-ec2
        Fetching: fog-1.23.0.gem (100%)
        Successfully installed fog-1.23.0
        Fetching: knife-ec2-0.10.0.gem (100%)
        Successfully installed knife-ec2-0.10.0
        2 gems installed

1. Launch an instance with knife ec2

        $ knife ec2 server create -I ami-4ab46b3d -f t1.micro -g sg-884f2eed,sg-8b4f2eee --ssh-user ubuntu -N nathen_hw_knife -r "recipe[hello_world]"

        $ open http://`knife node show nathen_hw_knife -a ec2.public_hostname | grep ec2.public_hostname |cut -f4 -d " "`

1.  Destroy the instance

knife ec2 server delete `knife node show nathen_hw_knife -a ec2.instance_id | grep ec2.instance_id | cut -f4 -d " "` -N nathen_hw_knife -P
