require 'dnapi'
base_dir = File.dirname(__FILE__)

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     "#{base_dir}/cookbooks"
node_name         DNApi.from(File.read("/etc/chef/dna.json")).id
