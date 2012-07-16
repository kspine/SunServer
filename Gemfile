# source 'http://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
#

gem 'paperclip', '~> 3.0'
gem 'jquery-rails'
gem 'therubyrhino'
gem 'haml'
gem 'devise'
gem 'will_paginate'
gem 'calendar_helper'
gem 'geocoder'
 
gem 'activerecord-jdbc-adapter'
gem 'jdbc-sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "3.1.4"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :production do
  gem 'activerecord-jdbcmysql-adapter'
end

group :development do
  gem 'ruby-debug'
  gem 'activerecord-jdbcsqlite3-adapter'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'guard-rspec', '~> 0.4.4'               # auto run rspec upon file changes
  gem 'database_cleaner', '~> 0.6.7'          # cucumber rails needs this
  gem 'factory_girl_rails', :require => false # generate model during testing
  gem 'spork', '~> 0.9.0.rc9'                 # preload fixed rails resouces
end
