class Chef
  class Recipe
    # Only Rails applications (containing script/runner) are valid
    def delayed_job_applications
      node[:applications]
    end
  end
end
