# Omniauth::Aid

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth/aid/plugin`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

## Configuring

You can configure several options, which you pass in to the `provider` method via a `Hash`:

Option name | Default | Explanation
--- | --- | ---
`scope` | `email` | A comma-separated list of permissions you want to request from the user. See the Facebook docs for a full list of available permissions: https://developers.facebook.com/docs/reference/login/
`display` | `page` | The display context to show the authentication page. Options are: `page`, `popup` and `touch`. Read the Facebook docs for more details: https://developers.facebook.com/docs/reference/dialogs/oauth/
`image_size` | `square` | Set the size for the returned image url in the auth hash. Valid options include `square` (50x50), `small` (50 pixels wide, variable height), `normal` (100 pixels wide, variable height), or `large` (about 200 pixels wide, variable height). Additionally, you can request a picture of a specific size by setting this option to a hash with `:width` and `:height` as keys. This will return an available profile picture closest to the requested size and requested aspect ratio. If only `:width` or `:height` is specified, we will return a picture whose width or height is closest to the requested size, respectively.
`info_fields` | 'name,email' | Specify exactly which fields should be returned when getting the user's info. Value should be a comma-separated string as per https://developers.facebook.com/docs/graph-api/reference/user/ (only `/me` endpoint).
`locale` |  | Specify locale which should be used when getting the user's info. Value should be locale string as per https://developers.facebook.com/docs/reference/api/locale/.
`auth_type` | | Optionally specifies the requested authentication features as a comma-separated list, as per https://developers.facebook.com/docs/facebook-login/reauthentication/. Valid values are `https` (checks for the presence of the secure cookie and asks for re-authentication if it is not present), and `reauthenticate` (asks the user to re-authenticate unconditionally). Use 'rerequest' when you want to request premissions. Default is `nil`.
`secure_image_url` | `false` | Set to `true` to use https for the avatar image url returned in the auth hash.
`callback_url` / `callback_path` | | Specify a custom callback URL used during the server-side flow. Note this must be allowed by your app configuration on Facebook (see 'Valid OAuth redirect URIs' under the 'Advanced' settings section in the configuration for your Facebook app for more details).

For example, to request `email`, `user_birthday` and `read_stream` permissions and display the authentication page in a popup window:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aid, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/omniauth-aid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
