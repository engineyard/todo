class Chef
  class Recipe
    def get_resque_worker_count      
      # $ sudo cat /proc/meminfo
      # MemTotal:        1759228 kB
      # ...
      mem_total_kb = `awk '/MemTotal/{print $2}' /proc/meminfo`.strip
      mem_total_mb = mem_total_kb / 1024

      # Want no more than ((total memory - 300) / est process size) workers + jobs to run
      # in other words, if all workers on the instance are running jobs, there should
      #   be memory left over
      result = (mem_total_mb - worker_memory) / worker_memory
      result /= 2 if node[:instance_role] == 'solo' || node[:instance_role] == 'eylocal'
      result
    end
  end
end