source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.10'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.5', '>= 6.0.5.1'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :production do
  #gem 'rails_12factor', '~> 0.0.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'devise_invitable', '~> 2.0.0'
gem 'devise-two-factor'
gem 'rqrcode'
gem 'figaro'
gem 'pry'
gem 'public_activity'
gem 'ransack'
gem 'simple_form'
gem 'pg', '~> 1.4', '>= 1.4.4'
gem 'aws-sdk-s3'
gem 'pagy', '~> 5.10', '>= 5.10.1'
gem 'faker'

#to export system audit logs in PDF
gem 'wicked_pdf', '~> 2.1'
gem 'wkhtmltopdf-binary'
gem 'wkhtmltopdf-heroku', '2.12.6.0'

#archiving/soft deletion
gem 'discard', '~> 1.2'
gem 'active_storage_validations'