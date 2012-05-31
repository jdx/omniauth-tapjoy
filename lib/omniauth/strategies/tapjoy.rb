require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Tapjoy < OmniAuth::Strategies::OAuth2
      option :name, :tapjoy

      option :client_options, {
        :site => "http://mystique.herokuapp.com",
        :authorize_path => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["name"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
