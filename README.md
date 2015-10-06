# Omniauth::Aid

This gem provides an OmniAuth strategy for using aID as an Oauth2-provider in your app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-aid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-aid

## Usage

`OmniAuth::Strategies::Aid` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aid, ENV['AID_KEY'], ENV['AID_SECRET']
end
```

For using the strategy with a straight up rack app, look at the [example Sinatra app](https://github.com/amedia/omniauth-aid/blob/master/example/config.ru)

## Configuring

You can configure several options, which you pass in to the `provider` method via a `Hash`:

Option name | Default | Explanation
--- | --- | ---
`scope` | `email` | A comma-separated list of permissions you want to request from the user. See the Facebook docs for a full list of available permissions: https://developers.facebook.com/docs/reference/login/
`image_size` | `square` | Set the size for the returned image url in the auth hash. Valid options include `square` (50x50), `small` (50 pixels wide, variable height), `normal` (100 pixels wide, variable height), or `large` (about 200 pixels wide, variable height). Additionally, you can request a picture of a specific size by setting this option to a hash with `:width` and `:height` as keys. This will return an available profile picture closest to the requested size and requested aspect ratio. If only `:width` or `:height` is specified, we will return a picture whose width or height is closest to the requested size, respectively.


For example, to request `name`, `birth_date` and `email` permissions and display the authentication page:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aid, ENV[AID_APP_KEY'], ENV[AID_APP_SECRET'],
           :scope => 'name, birth_date, email',
end
```
