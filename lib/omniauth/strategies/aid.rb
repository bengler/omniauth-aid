require 'omniauth/strategies/oauth2'
require 'json'

module OmniAuth
  module Strategies
    # Class used to parse and return omniauth responses from aID
    class Aid < OmniAuth::Strategies::OAuth2
      option :name, :aid
      option :authorize_options, [:scope, :stealth_mode]

      option :client_options,
             site: 'https://www.aid.no',
             authorize_url: '/api/portunus/v1/oauth/authorize',
             token_url: '/api/portunus/v1/oauth/token'

      uid { raw_info['id'] || raw_info['uuid'] }

      info do
        prune!('id' => raw_info['id'],
               'uuid' => raw_info['uuid'],
               'nickname' => raw_info['name'],
               'email' => raw_info['email'],
               'phone' => raw_info['phone'],
               'name' => raw_info['name'],
               'image' => raw_info
                         .fetch('_links') { {} }
                         .fetch('avatar') { {} }['href']
              )
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

      def raw_info
        @raw_info ||= begin
          response_body = access_token.get('/api/mercury/v2/users/me').body
          JSON.parse(response_body) || {}
        end
      end
    end
  end
end
