require 'omniauth/strategies/oauth2'

module Omniauth
  module Strategies
    class Aid  < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :aid

      option :client_options, {
               site: "http://www.aid.no.localhost.api.no",
               authorize_url: "/api/portunus/v1/oauth/authorize",
               token_url: "/api/portunus/v1/oauth/token"
             }

      uid { raw_info["id"] }

      # info do
      #   {
      #     email: raw_info["email"]
      #     # and anything else you want to return to your API consumers
      #   }
      # end

      # def raw_info
      #   @raw_info ||= access_token.get('/api/v1/me.json').parsed
      # end
    end
  end
end
