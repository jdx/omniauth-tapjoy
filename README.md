# omniauth-tapjoy
[![Build
Status](https://secure.travis-ci.org/Tapjoy/omniauth-tapjoy.png)](http://travis-ci.org/Tapjoy/omniauth-tapjoy)

This is an omniauth plugin that can be used to connect to Tapjoy.

## Installation with Devise

If you are using Devise, this is how you can use Tapjoy as your OAUTH provider.

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-tapjoy'
```

And then execute:

    $ bundle

Add this line to `config/intializers/devise.rb`:

```ruby
config.omniauth :tapjoy, 'TAPJOY_KEY', 'TAPJOY_SECRET'
```

Add a callback controller to be run after the user is authenticated: `app/controllers/users/omniauth_callbacks_controller.rb`

```ruby
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tapjoy
    user = request.env["omniauth.auth"]["info"]
    @user = User.find_or_initialize_by_email(user["email"].downcase)
    @user.first_name = user["first_name"]
    @user.last_name = user["last_name"]
    @user.save!

    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Tapjoy"
    sign_in_and_redirect @user, :event => :authentication
    finished('sign_up_text')
  end
end
```

Set the route to use the callback you just created:

```ruby
devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
```

If you aren't using Devise, you can either connect to the oauth server directly,
or directly use omniauth: [https://github.com/intridea/omniauth](https://github.com/intridea/omniauth)

## Example

For an example of this in use, check the wheeler board: [https://github.com/Tapjoy/wheeler_board](https://github.com/Tapjoy/wheeler_board)
