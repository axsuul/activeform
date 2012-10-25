# ActiveForm

Create quick form objects that can validate.

## Installation

Add this line to your application's Gemfile:

    gem 'activeform'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeform

## Usage

```ruby
class SignUpForm < ActiveForm::Base
  attr_accessor :newsletter

  validates_through User, new_password: :password
  validates :newsletter, presence: true
end
```

```ruby
form = LoginForm.new(params[:login_form])
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
