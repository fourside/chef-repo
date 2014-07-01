#
# Cookbook Name:: package_install
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{
  zsh
  git
  gcc
  libncurses5-dev
  make
}.each do |p|
  package p do
    action :install
  end
end

%w{
  bison
  zlib1g-dev
  libssl-dev
  libyaml-dev
  autoconf
}.each do |p|
  package p do
    action :install
  end
end

