require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Tapjoy < OmniAuth::Strategies::OAuth2
      option :name, :tapjoy

      option :client_options, {
        :site => "http://oauth.tapjoy.com",
        :authorize_path => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :id => raw_info["id"],
          :email => raw_info["email"],
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
          :name => "#{raw_info["first_name"]} #{raw_info["last_name"]}",
          :created_at => raw_info["created_at"],
          :facebook_id => raw_info["facebook_id"],
          :is_employee => raw_info["is_employee"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
