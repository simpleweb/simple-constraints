# Simple Constraints

Routing constraints are automatically included in the Rails router.

## Installation

Add this line to your application's Gemfile:

    gem 'simple-constraints'

And then execute:

    $ bundle

### Subdomain

The `subdomain` constraint allow you to specify routes that should only
be applied for certain subdomains. The `:only` option will only match
the subdomains given, the `:except` option won't match the given
subdomains. There is also a `:tld_length` (should be `1` for `.com`, `2`
for `.co.uk` etc) which defaults to 1.

```ruby
My::Application.routes.draw do
  subdomain only: 'blog' do
    resources :posts
  end

  subdomain except: ['www', 'mail'] do
    resources :spaces
    root to: 'spaces#index'
  end

  root to: 'pages#home'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
