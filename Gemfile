if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'

gem 'engineyard', '~> 3.2.1'


gem 'ey_config'
gem 'rails_autolink'
gem 'simple_form', '~> 3.1.0'

gem 'nokogiri', '~> 1.6.0'
gem 'rake', '~> 10.4'
gem 'rgeo', '~> 0.3'

# Assets
gem 'jquery-rails'
gem 'sass', '~> 3.4.9'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

platform :ruby do
  gem 'mysql2', '~> 0.3.17'
  gem 'pg', '~> 0.18.1'
  gem 'activerecord-postgis-adapter', '3.0.0.beta2'
  gem 'sqlite3'

  gem 'newrelic_rpm', '~> 3.9.9'
  gem 'unicorn'
  gem 'puma'
  gem 'json', '>= 2.0'
  gem 'minitest'
  gem 'psych', '~> 2.0.8'
  gem 'racc'
end

platforms :jruby do
  ar_jdbc_version = '~> 1.3'
  gem 'activerecord-jdbc-adapter', ar_jdbc_version
  gem 'activerecord-jdbcmysql-adapter', ar_jdbc_version
  gem 'activerecord-jdbcpostgresql-adapter', ar_jdbc_version
  gem 'activerecord-jdbcsqlite3-adapter', ar_jdbc_version
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  gem 'jdbc-postgres', :require => false

  gem 'jruby-openssl'
  gem 'trinidad'
end

platform :rbx do
  gem 'rubysl'
  gem 'rubysl-test-unit', :require => false
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do

end
