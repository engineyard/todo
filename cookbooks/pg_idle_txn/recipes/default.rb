cookbook_file 'install idle transaction killer' do
  path '/engineyard/bin/terminate_idle_txn.sh'
  source 'terminate_idle_txn.sh'
  owner 'root'
  group 'root'
  mode '744'
end

# schedule cron to run the shell script at regular intervals
cron 'terminate idle session' do
  user     'root'
  action   :create
  minute   '*/1'
  hour     '*'
  day      '*'
  month    '*'
  weekday  '*'
  command  '/engineyard/bin/terminate.sh >> /var/log/terminate.log 2>&1'
end
