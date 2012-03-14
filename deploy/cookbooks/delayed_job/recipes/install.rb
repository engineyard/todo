#
# Cookbook Name:: delayed_job
# Recipe:: install
#

# This recipe will setup `delayed_job` on a Solo instance environment or on named Utility instances in a cluster environment.
# Name your Utility instances with prefixes: `dj`, `delayed_job`, `delayedjob`. For example, `dj1`, `delayedjob4`.
if node[:instance_role] == "solo" || node[:instance_role] == "eylocal" ||
        (node[:instance_role] == "util" && node[:name] =~ /^(dj|delayed_job|delayedjob)/)
  delayed_job_applications().each do |app_name,data|

    directory "/engineyard/bin" do
      owner "root"
      group "root"
      mode 0755
    end

    template "/engineyard/bin/dj" do
      source "dj.erb"
      owner "root"
      group "root"
      mode 0755
    end

  end
end