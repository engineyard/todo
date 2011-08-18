source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'simple_form'
gem 'jquery-rails'

platform :ruby do
  gem "mysql2", "~> 0.2.7"
  gem "unicorn"
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jruby-openssl'
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  gem 'trinidad'
end




# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
	gem 'sqlite3' 
end
