# frozen_string_literal: true

require_relative "boot"

require "rails"

%w(
  active_record/railtie
  action_controller/railtie
  action_view/railtie
  active_storage/engine
  action_mailer/railtie
  active_job/railtie
  rails/test_unit/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application # rubocop:todo Style/Documentation
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.debug_exception_response_format = :default
    config.session_store :cookie_store, key: "_interslice_session"

    config.middleware.use ActionDispatch::Flash

    config.middleware.use config.session_store, config.session_options

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
