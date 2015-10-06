require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Aid  < OmniAuth::Strategies::OAuth2
      option :name, :aid
      option :authorize_options, [:scope]

      option :client_options, {
               site: "http://www.aid.no.localhost.api.no",
               authorize_url: "/api/portunus/v1/oauth/authorize",
               token_url: "/api/portunus/v1/oauth/token"
             }

      uid { raw_info["data"]["id"] }

      info do
        @raw_info.to_h
      end

      def raw_info
        @raw_info ||= access_token.get('/api/mercury/v2/users/me').parsed
      end
    end
  end
end
