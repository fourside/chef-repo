#
# Cookbook Name:: radio
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{
  rtmpdump
  libmp3lame-dev
  nasm
  ffmpeg
  libjpeg8-dev
  libgif-dev
  libfreetype6-dev
  g++
}.each do |pkg|
  package pkg do
    action :install
  end
end

bash "configure_and_make_install_swftools" do
  action :nothing
  flags "-xe"
  cwd node['swftools']['src_dir']
  code <<-EOH
  tar xzf #{node['swftools']['tar']}
  cd #{node['swftools']['dir']}
  ./configure #{node['swftools']['config_options']}
  make -j2
  make install
EOH
end

cookbook_file "#{node['swftools']['src_dir']}/#{node['swftools']['tar']}" do
  source node['swftools']['tar']
  notifies :run, 'bash[configure_and_make_install_swftools]', :immediately
end

