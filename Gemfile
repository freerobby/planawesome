source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "high_voltage", "~>1.0"
gem "omniauth", "~>0.3"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem "pg", "~>0.11"
end

group :development do
  gem 'sqlite3'
  gem "heroku", "~>2.10"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "factory_girl_rails", "~>1.3"
  gem "rspec-rails", "~>2.7"
end
