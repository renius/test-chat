require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ChatTest
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets false
      g.helpers false
      g.javascript false
      g.assets false
    end

    config.app_generators.scaffold_controller :responders_controller
    config.active_record.raise_in_transactional_callbacks = true
  end
end
