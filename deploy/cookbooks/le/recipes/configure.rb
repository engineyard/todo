#
# Cookbook Name:: le
# Recipe:: configure
#

execute "le register --user-key" do
  command "le register --user-key #{node[:le_user_key]}"
  action :run
end

follow_paths = [
  "/var/log/syslog",
  "/var/log/auth.log"
]
(node[:applications] || []).each do |app_name, app_info|
  follow_paths << "/var/log/nginx/#{app_name}.access.log"
end

follow_paths.each do |path|
  execute "le follow #{path}" do
    command "le follow #{path}"
    action :run
  end
end