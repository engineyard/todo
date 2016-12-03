on_utilities('sphinx') do
  run "[[ -d #{config.shared_path}/sphinx ]] && ln -nfs #{config.shared_path}/sphinx #{config.current_path}/db/sphinx"
  run "cd #{config.current_path} && RAILS_ENV=#{config.environment} bundle exec rake ts:configure"
end
