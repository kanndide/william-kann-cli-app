# WilliamKannCliApp

This gem is designed to show information on Berkshire Hathaway, Inc.'s (Warren Buffet)'s current holdings by pulling information from the SEC website for EDGAR (stands for something ridiculous, I'm sure). It pulls the information from the 13F-HR forms filed by the company (or investor) with the SEC.

[![Build Status](https://travis-ci.org/kanndide/william-kann-cli-app.svg?branch=master)](https://travis-ci.org/kanndide/william-kann-cli-app)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'william_kann_cli_app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install william_kann_cli_app

## Usage

Using this gem is fairly simple. Run it with bin/investors_cli. It basically walks you through the process but all you need to know is the year and quarter that you want to see information on. Bear in mind that 13F-HR reports aren't going to be in every quarter and that some of the older ones aren't in the correct format for this app at this time. Hopefully that will change in the future. Then again, hopefully this entire app will change to a more efficient beast all together.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/investors_cli` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kanndide/william_kann_cli_app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WilliamKannCliApp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kanndide/william_kann_cli_app/blob/master/CODE_OF_CONDUCT.md).
