# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>5.2.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', group: :development
gem 'pg'

gem 'newrelic_rpm', group: :production
gem 'rails_12factor', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'acts_as_votable', '~> 0.10.0'
gem 'devise', '~> 4.4', '>= 4.4.3'

gem 'puma'
gem 'puma_worker_killer'

gem 'bootstrap-sass'
gem 'font-awesome-sass'

group :development, :test do
  gem 'bullet'
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails_layout'
  gem 'rspec-rails', '~> 3.7'

  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '~> 2.0'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
