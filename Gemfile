ruby '2.1.1'
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17'
# JSON gem, allows for faster json parsing
gem 'yajl-ruby', '~> 1.2.0'

# Authorization
gem 'clearance', '~> 1.3.0'
gem 'authority', tag: 'v3.0.0', github: 'nathanl/authority'

# View related gems, i.e. use HAML
# as template engine and simple_form
gem 'haml',     '~> 4.0.5'
gem 'simple_form', tag: 'v3.1.0.rc1', github: 'plataformatec/simple_form'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'rails_layout'
gem 'flickraw', require: 'flickraw'
gem 'bootbox-rails', '~>0.3'
gem 'gravatar_image_tag'
gem 'momentjs-rails', '~> 2.5.0'
gem 'bootstrap3-datetimepicker-rails', '~> 3.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use puma as the app server
gem 'puma', '~> 2.8', require: false

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'omniauth'
gem 'omniauth-twitter'
gem 'twitter'


group :development do
  #gem 'foreman', '~> 0.67', require: false
  gem 'quiet_assets'
  gem 'mailcatcher'
  gem "erb2haml"

  # Deployment
  gem 'capistrano', '3.0.1', require: false
  gem 'capistrano-bundler', '1.1.1', require: false
  gem 'capistrano-rails', '1.1.0', require: false
end

