#
# Cookbook Name:: delayed_job
# Recipe:: default
#

require_recipe "delayed_job::install"
require_recipe "delayed_job::configure"
require_recipe "delayed_job::restart"
