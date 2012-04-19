puts "running solo..."
node = Yajl::Parser.new.parse(File.read("/etc/chef/dna.json"))
puts "node: " + node.inspect

base_dir = File.dirname(__FILE__)

cookbooks_path = "#{base_dir}/cookbooks"

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbooks_path
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]

puts "node: " + node.inspect