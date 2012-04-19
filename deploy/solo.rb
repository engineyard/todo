puts "running solo..."
puts "node: " + node.inspect

base_dir = File.dirname(__FILE__)

cookbooks_path = "#{base_dir}/cookbooks"

file_store_path   base_dir
file_cache_path   base_dir
cookbook_path     cookbooks_path
role_path         "#{base_dir}/roles"
node_name         node["engineyard"]["this"]

puts "node: " + node.inspect

require "fileutils"
$LOAD_PATH.each do |path|
  recipe_path = path.gsub(%r{/lib$},'')
  if File.exist?(metadata_path = File.join(recipe_path, 'metadata.json'))
    metadata = Yajl::Parser.new.parse(File.new(metadata_path, "r"))
    if metadata["name"]
      puts "Unpacking #{metadata["name"]} recipe into cookbooks from #{cookbooks_path}"
      FileUtils.cp_r(recipe_path, File.join(cookbooks_path, metadata["name"]))
    else
      puts "ERROR: Recipe has no 'name' in metadata.json (#{cookbooks_path})"
    end
  end
end
