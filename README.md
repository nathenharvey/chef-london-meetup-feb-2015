# Chef Provisioning

This is the code and presentation given at the [Chef Users London Meetup](http://www.meetup.com/Chef-Users-London/events/220137359/) in February, 2015.

An introduction to Chef Provisioning.

Slides can be found here and are also [available on Speaker Deck](https://speakerdeck.com/nathenharvey/chef-provisioning).

## Setup

1. Install ChefDK (v. 0.4.0 or higher)
2. Clone this repo
3. Create an `~/.aws/config` file with proper AWS credentials
4. Deploy the infrastructure
  * `chef-client --local simple.rb`
  * `chef-client --local security_group.rb`
  * `chef-client --local web.rb`
5. Clean-up the infrastructure
  * `chef-client --local destroy.rb`
  * Manually remove the security group
  * Manually remove the load balancer
  * `rm -rf chef-repo/data_bags/aws_security_groups/nathen-provisioning-security-group.json`
  * `rm -rf chef-repo/data_bags/loadbalancers/nathen-elb.json`
