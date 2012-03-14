class Chef
  class Recipe
    # Only Rails applications (containing script/runner) are valid
    def delayed_job_applications
      node[:applications].inject([]) do |apps, app_name_and_data|
        app_name, _ = app_name_and_data
        app_path = "/data/#{app_name}/current/script/runner"
        if File.exist?(app_path)
          apps << app_name_and_data
        end
        apps
      end
    end
  end
end
