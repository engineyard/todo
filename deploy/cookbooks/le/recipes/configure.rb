#
# Cookbook Name:: le
# Recipe:: configure
#
base_dir = File.dirname(__FILE__)
ey_services_config = YAML::load_file("#{base_dir}/../../../../config/ey_services_config_deploy.yml")

execute "le register --user-key" do
  command "le register --user-key #{ey_services_config["logentries"]["LE_API_KEY"]}"
  action :run
end

follow_paths = [
  "/var/log/syslog",
  "/var/log/auth.log"
]
(node[:applications] || []).each do |app_name, app_info|
  follow_paths << "/var/log/nginx/#{app_name}.access.log"
  follow_paths << "/data/#{app_name}/shared/log/#{node['environment']['framework_env']}.log"
end

follow_paths.each do |path|
  execute "le follow #{path}" do
    command "le follow #{path}"
    action :run
  end
end