#
# Cookbook Name:: hello_world
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

httpd_service "default" do
  action [:create, :start]
end

template "/var/www/index.html" do
  source "index.html.erb"
  owner "root"
  group "root"
  mode "0644"
end
