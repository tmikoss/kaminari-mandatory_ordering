# Kaminari::MandatoryOrdering

Makes sure ActiveRecord collections paged over by `kaminari` are ordered.

Forgetting to set order clause when loading records from database in pages can lead to duplicate or missing entries. This gem forces you not to make that mistake.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaminari-mandatory_ordering'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaminari-mandatory_ordering

## Usage

Look for `Kaminari::MandatoryOrdering::Error` exceptions, add order clauses to queries causing them.

Can be enabled / disabled by setting `mandatory_ordering` option in `kaminari` configuration (defaults to `true`).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tmikoss/kaminari-mandatory_ordering.

