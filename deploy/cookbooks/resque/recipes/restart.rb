#
# Cookbook Name:: resque
# Recipe:: default
#

node[:applications].each do |app_name, data|
  execute "ensure-resque-is-setup-with-monit" do 
    command %Q{monit reload}
  end

  execute "restart-resque" do 
    command %Q{echo "sleep 20 && monit -g #{app_name}_resque restart all" | at now }
  end
end