---
Team: aID
Stack: Ruby

---
<!--(Maintained Duplo labels above. Read more on http://info.api.no/handbook/guidelines/GitHub-guidelines.html)-->

<!--(Maintained Duplo labels above. Read more on http://info.api.no/handbook/guidelines/GitHub-guidelines.html)-->

<!--(Maintained Duplo labels above. Read more on http://info.api.no/handbook/guidelines/GitHub-guidelines.html)-->

<!--(Maintained Duplo labels above. Read more on http://info.api.no/handbook/guidelines/GitHub-guidelines.html)-->

<!--(Maintained Duplo labels above. Read more on http://info.api.no/handbook/guidelines/GitHub-guidelines.html)-->

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

You can configure several options, which you pass in to the `provider` method via a `Option`:

Hash name | Default | Explanation
--- | --- | ---
`scope` | `id name` | A space-separated list of permissions you want to request from the user. Optional scopes are: `email`, `phone`, `birth_date`, `tracking_key`, `access`, `external_accounts`, `customer`, `avatar`

For example, to request `name`, `birth_date` and `email` permissions and display the authentication page:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :aid, ENV['AID_APP_KEY'], ENV['AID_APP_SECRET'],
           :scope => 'name birth_date email'
end
```

## Test-driving the gem
A simple way to test if the aID-strategy is working is to install the [Omniauth-test-harness rails app](https://github.com/PracticallyGreen/omniauth-test-harness) and provide it with the scopes and app-configuration provided for using aID as an Omniauth-provider.
