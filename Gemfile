source 'https://rubygems.org'

gem 'capistrano'
gem 'capistrano-ext'
gem 'rmagick', require: 'RMagick'
gem "jquery-rails"
gem 'coteyr_pack', git: "git@git.coteyr.net:coteyr_pack.git"
gem 'american_date'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 1.2'
gem 'protected_attributes'

group :development, :test do
  gem 'sqlite3', require: 'sqlite3'
  gem 'autotest-growl'
  gem 'autotest'
  gem 'autotest-standalone', require: 'autotest'
  gem 'autotest-rails-pure'
  gem 'ansi'
  gem 'autotest-fsevent'
  gem 'fabrication'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spork-rails'
  gem "shoulda-matchers"
  gem 'webrat'
  gem 'rails-erd'
  gem 'syntax'
end
gem 'simplecov', require: false, group: :test

group :production, :staging do
  gem 'mysql'
  gem 'uglifier'
  gem 'execjs'
  gem 'therubyracer'
end
