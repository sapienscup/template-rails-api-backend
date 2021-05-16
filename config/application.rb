require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Walrus
  # Walrus
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # We want to set up a custom logger which logs to STDOUT.
    # Docker expects your application to log to STDOUT/STDERR and to be ran
    # in the foreground.

    #  The available log levels are: :debug, :info, :warn, :error, :fatal, and :unknown
    if Rails.env.development?
      config.log_level = :debug
    else
      config.log_level = :error
    end

    config.log_tags = [:subdomain, :uuid]
    # config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
    config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")

    # Since we're using Redis for Sidekiq, we might as well use Redis to back
    # our cache store. This keeps our application stateless as well.
    config.cache_store = :redis_store, ENV["CACHE_URL"], { namespace: "walrus::cache" }

    # If you've never dealt with background workers before, this is the Rails
    # way to use them through Active Job. We just need to tell it to use Sidekiq.
    config.active_job.queue_adapter = :sidekiq
    
    config.i18n.default_locale = :"pt-BR"

    config.api_only = true

    config.time_zone = "America/Sao_Paulo"

    # config.debug_exception_response_format = :api

    config.after_initialize do |app|
      app.routes.append{ match '*a', :to => 'application#not_found' } unless config.consider_all_requests_local
    end

    # config.action_dispatch.signed_cookie_digest = "SHA256"

    # config.action_dispatch.cookies_rotations.tap do |cookies|
    #   cookies.rotate :signed, digest: "SHA1"
    # end
  end
end
