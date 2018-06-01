# Kaminari::MandatoryOrdering [![Build Status](https://travis-ci.org/tmikoss/kaminari-mandatory_ordering.svg?branch=master)](https://travis-ci.org/tmikoss/kaminari-mandatory_ordering)

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

Can be enabled / disabled by changing  `Kaminari::MandatoryOrdering.enabled` value (defaults to `true`).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests and `rubocop` to check code style. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tmikoss/kaminari-mandatory_ordering.

