#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "configure and make install" do
  action :nothing
  flags "-xe"
  cwd node['vim']['src_dir']
  code <<-EOH
  tar xf #{node['vim']['tar']}
  cd #{node['vim']['dir']}
  ./configure #{node['vim']['config_options']}
  make -j2
  make install
EOH
end

cookbook_file "#{node['vim']['src_dir']}/#{node['vim']['tar']}" do
  source node['vim']['tar']
  notifies :run, 'bash[configure and make install]', :immediately
end

