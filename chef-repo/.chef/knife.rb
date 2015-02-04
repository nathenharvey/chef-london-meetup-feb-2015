# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "nharveycul215"
client_key               "#{current_dir}/nharveycul215.pem"
validation_client_name   "nharveycul215-validator"
validation_key           "#{current_dir}/nharveycul215-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/nharveycul215"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:aws_ssh_key_id]  = ENV['AWS_KEYPAIR_NAME_EU']
knife[:aws_access_key_id]  = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
knife[:region] = "eu-west-1"
