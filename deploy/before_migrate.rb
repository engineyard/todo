# Set up a chef 0.10 dna.json file (for stack-v1 + stack-v2)
# TODO does this run on non-app-master/solo?
custom_json = node.dup
custom_json['run_list'] = 'recipe[main]'
File.open("/etc/chef-custom/dna.json", 'w') do |f|
  f.puts JSON.pretty_generate(custom_json)
  f.chmod(0600)
end

# Runs application cookbooks
run "cd #{latest_release}; sudo bundle exec chef-solo -c #{latest_release}/deploy/solo.rb -j /etc/chef-custom/dna.json"
