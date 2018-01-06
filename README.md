# ManageIQ::GraphQL

The [GraphQL](http://graphql.org/) V2 API for [ManageIQ](https://github.com/ManageIQ/manageiq)

**Note: This project is currently in early alpha**

## Installation

Add the following to ManageIQ's Gemfile:

```ruby
gem 'manageiq-graphql', :git => "https://github.com/manageiq/manageiq-graphql"
```

Then execute:

```bash
$ bundle install
```

Finally, mount the engine's routes in ManageIQ's `config/routes.rb`:

```ruby
mount ManageIQ::GraphQL::Engine, :at => '/graphql'
```

## Running the test suite

```ruby
$ bin/rspec
```

## License

The gem is available as open source under the terms of the [Apache-2.0 License](https://opensource.org/licenses/Apache-2.0).
