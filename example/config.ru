require 'bundler/setup'
require 'omniauth-aid'
require './app.rb'

use Rack::Session::Cookie, :secret => 'my-secret-string'

use OmniAuth::Builder do
  provider :aid, ENV['AID_APP_ID'], ENV['AID_APP_SECRET'], :scope => 'name, email'
end

run Sinatra::Application
