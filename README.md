# DeepMergeExistingKeys

Extends Rails's deep_merge method to merge only existing keys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deep_merge_existing_keys'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deep_merge_existing_keys

## Usage

```ruby
old_hash = { a: 10, b: 20, c: { c1: 30, c2: { c2a: 40 } } }
new_hash = { b: 25, c: { c1: 35, c2: { c2b: 55 } }, d: 65 }

merged_hash = old_hash.deep_merge_existing_keys new_hash
merged_hash # { a: 10, b: 25, c: { c1: 35, c2: { c2a: 40 } }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lespoupeesrusses/deep_merge_existing_keys. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DeepMergeExistingKeys project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lespoupeesrusses/deep_merge_existing_keys/blob/master/CODE_OF_CONDUCT.md).
