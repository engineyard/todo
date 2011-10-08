source 'http://rubygems.org'

gem 'rails', :git => 'git://github.com/rails/rails.git', :branch => '3-1-stable'

gem 'simple_form', '1.5.1'
gem 'jquery-rails', '1.0.14'
gem 'rails_autolink'

platform :ruby do
  gem 'mysql2', '~> 0.3', :group => :production
  gem 'sqlite3', :groups => [:development, :test] 
  gem 'unicorn'
end

platforms :jruby do
  gem 'activerecord-jdbcmysql-adapter', :group => :production
  gem 'activerecord-jdbcsqlite3-adapter', :groups => [:development, :test]
  gem 'jruby-openssl'
  gem 'trinidad'
end

group :assets do  
  gem 'sass-rails', " ~> 3.1.0"  
  gem 'coffee-rails', " ~> 3.1.0"  
  gem 'uglifier'  
end


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do

end
