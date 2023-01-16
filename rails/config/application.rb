require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VaultCodeSamplesRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.eager_load_paths << Rails.root.join("lib")

    # The ActiveRecord encryption API requires setting these in order to function.
    # Since we use Piiano Vault in this example, we override these.
    config.active_record.encryption.primary_key = "dummy"
    config.active_record.encryption.deterministic_key = "dummy"
    config.active_record.encryption.key_derivation_salt = "dummy"
  end
end
