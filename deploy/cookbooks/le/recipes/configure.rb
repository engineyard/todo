#
# Cookbook Name:: le
# Recipe:: configure
#

puts node.inspect

le_key = nil

node[:engineyard][:environment][:apps].each do |app|
  puts app.inspect
  app[:components].each do |component|
    puts component.inspect
    if component[:key] == "addons"
      component[:collection].each do |elem|
        puts elem.inspect
        if elem[:name] == "Logentries"
          le_key = component[:config][:vars]["LE_API_KEY"]
        end
      end
    end
  end
end

puts "le_key: #{le_key}"

execute "le register --user-key" do
  command "le register --user-key #{le_key}"
  action :run
end

follow_paths = []
(node[:applications] || []).each do |app_name, app_info|
  follow_paths << "/data/#{app_name}/shared/log/#{node['environment']['framework_env']}.log"
end

follow_paths.each do |path|
  execute "le follow #{path}" do
    command "le follow #{path}"
    action :run
  end
end