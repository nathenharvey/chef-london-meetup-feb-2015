require 'chef/provisioning/aws_driver'
with_driver 'aws'

machine 'nathen_web1' do
  recipe 'hello_world'
end
