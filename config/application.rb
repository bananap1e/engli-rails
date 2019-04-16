require_relative 'boot'

require 'rails/all'



Bundler.require(*Rails.groups)

module RailsEngli
  class Application < Rails::Application

    config.load_defaults 5.2
    WillPaginate.per_page = 10
  end
end
