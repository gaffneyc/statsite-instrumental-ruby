require "bundler/setup"

require "instrumental/statsite"

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies.
  config.order = "random"
end
