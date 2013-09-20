# Capybara Facebook Macros

Adds a few convenient methods to capybaras DSL for interacting with Facebook. Using the credentials of a Facebook test user associated with your facebook app the gem provides methods for logging in, accepting read and write permissions, logging out and deauthing the app

They have been used and tested against selenium and capybara webkit drivers running locally as well as capybara-webkit running against a Xvfb headless server on Jenkins.

## Installation

Add this line to your application's Gemfile:

    gem 'capybara-facebook-macros'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-facebook-macros

## Usage

Within a capybara feature:
    
    # given a css selector that triggers the auth dialogue, login and accept. 
    
    complete_facebook_dialogues_on_click('#login', {:email => testuser@fb.com , :password => 1234})
    
    # email/password can be a hash or any class that has the attributes email, password ie test_user 
    # has test_user.email and test_user.password,
    # 
    
    complete_facebook_dialogues_on_click('#login', test_user)
    
    # logout og facebook
    
    logout
    
    # if interacting with the page asks for additional permision ie facebok photos when choosing a picture
    # handle the additional flow. Works for both read and write.
    
    accept_additional_permissions
    
    # remove the app permission 
    
    deauth_app

## TODO

 - Tests

## Contributing

Any problems log them on the issues tracker or submit a pull request and passing tests

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
