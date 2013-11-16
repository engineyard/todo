if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'http://rubygems.org'

gem "rails", "~> 3.2.12"

gem 'simple_form'
gem 'jquery-rails'
gem 'rails_autolink'
gem 'ey_config'
gem 'puma'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

platform :ruby do
  gem 'pg'
  gem 'sqlite3'
  gem 'mysql2'
  gem 'newrelic_rpm'
  gem 'ey_config'
  gem 'unicorn'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter', '~> 1.3'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'jruby-openssl'
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  gem 'jdbc-postgres', :require => false
  gem 'trinidad'
  gem 'thor'
end

platform :rbx do
  gem 'rubysl', '~> 2.0'
  gem 'json'
  gem 'racc'
  gem 'psych'
  gem 'minitest'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do

end
