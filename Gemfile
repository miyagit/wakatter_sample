source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

# Default
gem 'bootsnap', "~> 1.14", require: false
gem 'jbuilder', "~> 2.11"
gem 'mysql2', "~> 0.5"
gem 'sqlite3', "~> 1.4"
gem 'puma', "~> 6.0"
gem 'rails', '7.0.3.1'
gem 'sass-rails', "~> 6.0"
gem 'turbolinks', "~> 5.2"
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', "~> 5.4"

# Front
gem 'bootstrap-sass', "~> 3.4"
gem 'erb2haml', "~> 0.1"
gem 'haml-rails', "~> 2.1"
gem 'font-awesome-sass'

# Environment variable
gem 'dotenv-rails', '~> 2.2'
gem 'concurrent-ruby', '1.3.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails', '~> 6.2'
end

# Auth Gems
gem 'devise', "~> 4.8"

# Image uploader
gem 'carrierwave', "~> 2.2"
gem 'fog-aws'

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', "~> 4.2"
  gem 'listen', "~> 3.7"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', "~> 4.1"
  gem 'spring-watcher-listen', "~> 2.1"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', "~> 3.38"
  gem 'selenium-webdriver', "~> 4.6"
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', "~> 5.2"
end

group :production do
  gem 'rails_12factor', "~> 0.0"
end
