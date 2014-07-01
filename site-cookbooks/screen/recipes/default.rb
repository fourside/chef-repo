#
# Cookbook Name:: screen
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "make_and_install" do
  action :nothing
  flags '-ex'
  cwd "#{node['src_dir']}/#{node['dir']}"
  code <<-EOS
  ./autogen.sh
  ./configure --prefix=#{node['prefix']} --enable-colors256
  make -j2
  make install
EOS
end

git "/usr/local/src/screen" do
  action :checkout
  repository "git://git.savannah.gnu.org/screen.git"
  revision "master"
  notifies :run,  'bash[make_and_install]'
end
