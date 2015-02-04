require 'chef/provisioning/aws_driver'
with_driver 'aws'

with_machine_options :bootstrap_options => {
  :instance_type => 't1.micro',
  :image_id => 'ami-4ab46b3d',
  :key_name => "chef_default"
}

(0...4).each do |i|
  machine_name = "nathen_web0#{i}"

  machine machine_name do
    action :destroy
  end
end

machine 'nathen_web1' do
  action :destroy
end
