require 'chef/provisioning/aws_driver'
with_driver 'aws'

with_data_center 'eu-west-1' do
  aws_security_group "nathen-provisioning-security-group" do
    inbound_rules [
      {:ports => 22, :protocol => :tcp, :sources => ["0.0.0.0/0"] },
      {:ports => 80, :protocol => :tcp, :sources => ["0.0.0.0/0"] }
    ]
  end
end
