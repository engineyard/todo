# Runs application cookbooks
run "cd #{latest_release}; sudo bundle exec chef-solo -c #{latest_release}/deploy/solo.rb -j /etc/chef/dna.json"
