#
# Cookbook Name:: resque
# Recipe:: configure
#

if node[:instance_role] == "solo" || node[:instance_role] == "eylocal" || 
                (node[:instance_role] == "util" && node[:name] !~ /^(resque)/)
  resque_workers_count = get_resque_worker_count()

  remote_file "/usr/local/bin/resque_kill_stale" do
    owner 'root'
    group 'root'
    mode 0755
    source "resque_kill_stale"
  end

  directory "/tmp/resque_ttls" do
    owner "root"
    group "root"
    mode 0755
  end
  
  crond "Kill stale resque workers" do
    filename "resque_kill_stale"
    interval "* * * * *"
    command %Q{/usr/local/bin/resque_kill_stale /tmp/resque_ttls}
  end

  directory "/var/log/resque" do
    owner node[:owner_name]
    group node[:owner_name]
    mode 0755
  end

  node[:applications].each do |app_name, data|
    # app-server specific recipes usually take care of this
    link "/data/#{app_name}/shared/log" do
      to "/var/log/resque"
    end
  end
end

if %w[solo app app_master util].include? node[:instance_role]
  redis_instance = node.engineyard.environment.utility_instances.find {|x| x.name == "redis"} ||
                       node.engineyard.environment.db_master ||
                       node.engineyard.environment.instances.find { |x| x.role == "solo" }

  node[:applications].each do |app, data|
    template "/data/#{app}/shared/config/resque.yml" do
      owner node[:owner_name]
      group node[:owner_name]
      mode 0655
      source "resque.yml.erb"
      variables(:framework_env => node[:environment][:framework_env],
                :redis_host => redis_instance.public_hostname,
                :redis_port => 6379)
    end
  end
end

