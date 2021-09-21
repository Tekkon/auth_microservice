# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'sequel', '~> 5.32.0'

gem 'puma', '~> 4.3'

gem 'sinatra', '~> 2.0.0', require: 'sinatra/base'
gem 'sinatra-contrib', '~> 2.0.0'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi', '~> 1.5'

gem 'i18n', '~> 1.8.2'
gem 'config', '~> 2.2.1'

gem 'dry-initializer', '~> 3.0.3'
gem 'dry-validation', '~> 1.5.0'

gem 'require_all'

gem 'dotenv'

group :test do
  gem 'factory_bot', '~> 5.2.0'
  gem 'rack-test', '~> 1.1.0'
  gem 'rspec', '~> 3.9.0'
  gem 'database_cleaner-sequel', '~> 1.8.0'
end
