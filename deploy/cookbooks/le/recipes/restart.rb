#
# Cookbook Name:: le
# Recipe:: restart
#

# TODO - manage by monit
execute "le monitor" do
  command "nohup le monitor &"
  action :run
end
