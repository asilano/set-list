source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.0.0'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use Slim for templates
gem 'slim-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'compass-rails'
gem 'sassy-buttons'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "rspec-rails", '~> 3.5'
  gem "factory_girl_rails"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

  gem 'thin'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :test do
  gem "database_cleaner"
  gem "email_spec"
  gem "launchy"
  gem "capybara"
  gem 'selenium-webdriver'
  gem 'coveralls', require: false
  gem 'codeclimate-test-reporter', require: false
  gem 'timecop'
  gem 'shoulda-matchers'

  # Let Travis see Rake
  gem 'rake'
end


gem 'andand'

# github.com/laserlemon/figaro - provide config in .gitignored application.yml
# accessible through ENV (like Heroku does)
gem 'figaro'

# User authentication by devise
gem 'devise', '~> 3.5'

# Squeel - simpler SQL queries through AREL
gem 'squeel'
