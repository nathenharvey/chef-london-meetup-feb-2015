require 'chef/provisioning/aws_driver'
with_driver 'aws'

security_group = data_bag_item('aws_security_groups',
                                'nathen-provisioning-security-group')

security_group_id = security_group['security_group_id']

with_machine_options :bootstrap_options => {
  :instance_type => 't1.micro',
  :image_id => 'ami-4ab46b3d',
  :security_group_ids => [security_group_id],
  :key_name => "chef_default"
}

machine_names = []

machine_batch do
  (0...4).each do |i|
    machine_name = "nathen_web0#{i}"
    machine_names << machine_name

    machine machine_name do
      recipe 'hello_world'
      converge true
    end
  end
end

load_balancer "nathen-elb" do
  load_balancer_options :availability_zones => ['eu-west-1a', 'eu-west-1b', 'eu-west-1c'],
                        :listeners => [{
                             :port => 80,
                             :protocol => :http,
                             :instance_port => 80,
                             :instance_protocol => :http,
                         }]
  machines machine_names
end
