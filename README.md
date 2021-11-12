# TimeService
The best time service in Texas!

## If I Had More Time....
1. More testcases for calculating
2. More input validations
3. Better logging
4. I would refactor `add_minutes` to be more clear and split up into other functions (see TODOs)
5. I would possibly change structure of classes

## Good way check out this code

Dependencies: 
```
$ bundler --version
Bundler version 2.1.4
$ ruby --version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]
```
Runbook:
```
$ cd ~/time_service # make sure you are in project root :-)
$ bundle install
Using rake 12.3.3
Using bundler 2.1.4
Using minitest 5.14.4
Using time_service 0.1.0 from source at `.`
Bundle complete! 3 Gemfile dependencies, 4 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

$ rake test
Run options: --seed 24741

# Running:

I, [2021-11-11T23:36:39.438394 #433467]  INFO -- TimeService: initialize via block...
I, [2021-11-11T23:36:39.438427 #433467]  INFO -- TimeService: calculate ["9:00", "PM"] plus 68 minutes
I, [2021-11-11T23:36:39.438439 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438475 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=10, time_minutes="08", meridian_indicator="PM">
.I, [2021-11-11T23:36:39.438588 #433467]  INFO -- TimeService: initialize via block...
.I, [2021-11-11T23:36:39.438627 #433467]  INFO -- TimeService: calculate ["9:00", "PM"] plus 10008 minutes
I, [2021-11-11T23:36:39.438638 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438648 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=7, time_minutes=48, meridian_indicator="PM">
I, [2021-11-11T23:36:39.438660 #433467]  INFO -- TimeService: calculate ["7:44", "AM"] plus 511 minutes
I, [2021-11-11T23:36:39.438667 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438676 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=4, time_minutes=15, meridian_indicator="PM">
I, [2021-11-11T23:36:39.438685 #433467]  INFO -- TimeService: calculate ["12:13", "AM"] plus 100 minutes
I, [2021-11-11T23:36:39.438692 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438700 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=1, time_minutes=53, meridian_indicator="AM">
I, [2021-11-11T23:36:39.438709 #433467]  INFO -- TimeService: calculate ["12:13", "AM"] plus 45380 minutes
I, [2021-11-11T23:36:39.438735 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438752 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=12, time_minutes=33, meridian_indicator="PM">
..I, [2021-11-11T23:36:39.438797 #433467]  INFO -- TimeService: calculate ["9:00", "PM"] plus 68 minutes
I, [2021-11-11T23:36:39.438807 #433467]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:36:39.438816 #433467]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=10, time_minutes="08", meridian_indicator="PM">
.

Finished in 0.000767s, 6517.5712 runs/s, 13035.1423 assertions/s.
5 runs, 10 assertions, 0 failures, 0 errors, 0 skips

$ bin/console
irb(main):001:0> TimeService::Service.new {['9:00 PM', 10008]}.add_minutes
I, [2021-11-11T23:34:25.354691 #433361]  INFO -- TimeService: initialize via block...
I, [2021-11-11T23:34:25.354735 #433361]  INFO -- TimeService: calculate ["9:00", "PM"] plus 10008 minutes
I, [2021-11-11T23:34:25.354747 #433361]  INFO -- TimeService: finished calculating!
I, [2021-11-11T23:34:25.354760 #433361]  INFO -- TimeService: the new time is #<struct TimeService::Time::NewTime hour=7, time_minutes=48, meridian_indicator="PM">
=> "7:48 PM"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_service'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install time_service

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/time_service.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# time_service
