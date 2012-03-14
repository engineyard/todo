#
# Cookbook Name:: delayed_job
# Recipe:: restart
#

# This recipe will setup `delayed_job` on a Solo instance environment or on named Utility instances in a cluster environment.
# Name your Utility instances with prefixes: `dj`, `delayed_job`, `delayedjob`. For example, `dj1`, `delayedjob4`.
if node[:instance_role] == "solo" || node[:instance_role] == "eylocal" ||
        (node[:instance_role] == "util" && node[:name] =~ /^(dj|delayed_job|delayedjob)/)
  delayed_job_applications().each do |app_name,data|

    execute "monit-reload-restart" do
      command "sleep 30 && monit reload && monit restart all -g dj_#{app_name}"
      action :run
    end

  end
end