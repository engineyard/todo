if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'

gem 'ey_config'
gem 'rails_autolink'
gem 'simple_form'

# Assets
gem 'jquery-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

platform :ruby do
  gem 'mysql2'
  gem 'activerecord-postgis-adapter', '3.0.0.beta2'

  gem 'newrelic_rpm'
  gem 'unicorn'
  gem 'puma'
  gem 'json'
  gem 'minitest'
  gem 'psych'
  gem 'racc'
end

platform :ruby, :mswin, :mingw, :x64_mingw do
  gem 'pg'
  gem 'sqlite3'
end

platform :mswin, :mingw, :x64_mingw do
  gem 'tzinfo-data'
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
