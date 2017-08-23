require_relative 'boot'

require 'rails/all'
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ApiCurious
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators.system_tests = nil
  end
end
