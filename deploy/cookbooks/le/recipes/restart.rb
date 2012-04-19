#
# Cookbook Name:: le
# Recipe:: restart
#

# TODO - manage by monit
execute "le monitor" do
  command "le monitordaemon &"
  action :run
end
