#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "configure and make install" do
  action :nothing
  flags "-xe"
  cwd node['ruby']['src_dir']
  code <<-EOH
  tar xzf #{node['ruby']['tar']}
  cd #{node['ruby']['dir']}
  ./configure #{node['ruby']['config_options']}
  make -j2
  make install
EOH
end

cookbook_file "#{node['ruby']['src_dir']}/#{node['ruby']['tar']}" do
  source node['ruby']['tar']
  notifies :run, 'bash[configure and make install]', :immediately
end

