# VimeoRuby 0.4.3

Welcome to VimeoRuby!

## Development Philosophy/Mindset

The mindset of this project at this stage of development is to:
1. Be simple - Write boring code, resist pulling in additional gems as much as possible, and don't worry about edge cases or handling errors all that much right now.
2. Try to be as object-oriented as possible. I'm not an OO expert and you don't have to be either but let's try to improve our OO skills.
3. Have fun. Who wants another job? Not me so let's keep it light and make something cool!

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add vimeo_ruby

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install vimeo_ruby

## Usage

### Configure Credentials

First, make sure you have a Vimeo account and have access to the following credentials from your Vimeo [My Apps dashboard](https://developer.vimeo.com/apps):

`access_token`, `client_identifier`, and `client_secret`

Once you have access to these, assign them to the following environment variables accordingly:

```ruby
VIMEO_ACCESS_TOKEN=<access_token_value>
VIMEO_CLIENT_IDENTIFIER=<client_identifier_value>
VIMEO_CLIENT_SECRET=<client_secrete_value
```

Now you should be ready to continue onward and experiment with this first iteration of the gem interface.

Currently there are two main classes the you should use to interface with the Vimeo API through which are `VimeoRuby::User` and `VimeoRuby::Video`.

### Working with the VimeoRuby::User class

For example, should you want to find a particular Vimeo user by their `vimeo_id`, you can make the following call:
```ruby
vimeo_user = VimeoRuby::User.get_user(<vimeo_id>) # Makes http request to the Vimeo API
#=> #<VimeoRuby::User:0x000000011230df50
```

Alternatively, you can call the `get_user` method on the `VimeoRuby` module itself if you wish for something a bit shorter:
```ruby
vimeo_user = VimeoRuby.get_user(<vimeo_id>) # Makes http request to the Vimeo API
#=> #<VimeoRuby::User:0x000000011230df50
```

With the `VimeoRuby::User` instance that was returned from the successful call we can see what methods are available by running the preceeding and the following code in an irb session with the gem loaded:
```ruby
vimeo_user.methods.sort - Object.methods
=>  [:additional_info,
     :available_for_hire,
     :available_for_hire?,
     :base_uri,
     :bio,
     :can_work_remotely,
     :can_work_remotely?,
     :location,
     :profile_link,
     :uploaded_videos,
     :vimeo_id]
```

We can then take the `vimeo_user` that we currently have stored and retrieve a collection of all of the users uploaded videos with the following:
```ruby
uploaded_video_collection = vimeo_user.uploaded_videos # Makes http request to the Vimeo API only if the `vimeo_user.video_collection` value is nil or if query_params have been supplied.
# => #<VimeoRuby::User::UploadedVideoCollection:0x00000001130e98b8
```

The `VimeoRuby::User::UploadedVideoCollection` object stores an array of `VimeoRuby::Video` objects which are accessible by calling:
```ruby
uploaded_video_collection.videos # No http request is made to the Vimeo API
#=> [#<VimeoRuby::Video:0x0000000112fb3228
#     ....,
#     ....,
#    ]
```

### Working with the VimeoRuby::Video class

To retrieve a particular video from Vimeo you can use the following call:
```ruby
vimeo_video = VimeoRuby::Video.get_video(<vimeo_id>)
#=> #<VimeoRuby::Video:0x000000022341eg61
```

Alternatively, you can call the `get_video` method on the `VimeoRuby` module itself if you wish for something a bit shorter:
```ruby
vimeo_video = VimeoRuby.get_video(<vimeo_id>) # Makes http request to the Vimeo API
#=> #<VimeoRuby::Video:0x0000000223gc4339
```

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
