puts "running solo..."
node = JSON.parse(File.read("/etc/chef/dna.json"))

base_dir = File.dirname(__FILE__)

cookbooks_path = "#{base_dir}/cookbooks"

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbooks_path
node_name         node["engineyard"]["this"]