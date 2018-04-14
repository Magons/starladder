require 'starladder'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder, ENV['STARLADDER_ID'], ENV['STARLADDER_SECRET']
end