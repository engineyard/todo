#
# Cookbook Name:: le
# Recipe:: install
#

directory "/engineyard/portage/engineyard/dev-util/le" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

remote_file "/engineyard/portage/engineyard/dev-util/le/le-0.8.15.ebuild" do
  source "https://logentries.com/media/data/le-0.8.15.ebuild"
  mode "0644"
  not_if { File.exists?("/engineyard/portage/engineyard/dev-util/le/le-0.8.15.ebuild") }
end

execute "ebuild le-0.8.15.ebuild digest" do
  command "ebuild le-0.8.15.ebuild digest"
  cwd "/engineyard/portage/engineyard/dev-util/le/"
  # only_if { `eix dev-util/le -O` =~ /No matches found./ }
end

package 'dev-util/le' do
  version '0.8.15'
  action :install
end
