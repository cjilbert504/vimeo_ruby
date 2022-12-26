# VimeoRuby

Welcome to VimeoRuby!

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add vimeo_ruby

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install vimeo_ruby

## Usage

WIP

## Development

At the moment, you will need to create a Vimeo account to obtain your own `access_token`, `client_identifier`, and `client_secret` if you wish to work on building out an interface to any of the Vimeo API endpoints.
Will be working on a solution to remedy this step in the future but for now, after obtaining these, set the values to the following env vars on your local machine accordingly:
- `VIMEO_ACCESS_TOKEN`
- `VIMEO_CLIENT_IDENTIFIER`
- `VIMEO_CLIENT_SECRET`

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

### Maintainers only

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cjilbert504/vimeo_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/cjilbert504/vimeo_ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VimeoRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cjilbert504/vimeo_ruby/blob/main/CODE_OF_CONDUCT.md).
