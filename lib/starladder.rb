require 'omniauth/strategies/oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2
      option :name, 'starladder'

      option :client_options, { site:          'https://auth.starladder.com',
                                authorize_url: 'https://auth.starladder.com/en/oauth/authorize' }

      uid { raw_info['id'] }

      info do
        {
          nick:  raw_info['nick'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/en/api/v1/me.json').parsed
      end

      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end
    end
  end
end
