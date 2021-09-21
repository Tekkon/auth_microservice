# frozen_string_literal: true

task :settings do
  require 'config'
  require_relative '../config/initializers/dotenv'
  require_relative '../config/initializers/config'
end
