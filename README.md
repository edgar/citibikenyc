# Citibikenyc [![Build Status](https://travis-ci.org/edgar/citibikenyc.png?branch=master)](https://travis-ci.org/edgar/citibikenyc) [![Dependency Status](https://gemnasium.com/edgar/citibikenyc.png)](https://gemnasium.com/edgar/citibikenyc)
A gem for CitibikeNYC API - citibikenyc.com

## Installation

Add this line to your application's Gemfile:

    gem 'citibikenyc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install citibikenyc

## API Usage Examples

    require "rubygems"
    require "citibikenyc"

    # Get a list of all stations
    puts Citibikenyc.stations

    # Get only the current status for all stations
    puts Citibikenyc.stations_status

    # Get helmets info
    puts Citibikenyc.helmets

    # Get branches info
    puts Citibikenyc.branches

For more information about the data returned by every method please check the specs folder

## Configuration

Because citibikenyc gem is based on [Faraday](https://github.com/lostisland/faraday), it supports the following adapters:

* Net::HTTP (default)
* [Excon][]
* [Typhoeus][]
* [Patron][]
* [EventMachine][]

Beside the adapter, you can change the following properties:

* endpoint
* format
* user_agent
* proxy
* debug

For instance:

    require 'typhoeus/adapters/faraday' # You will need the typhoeus gem

    client = Citibikenyc.client(adapter: :typhoeus, user_agent: "foobar v1", debug: true)
    client.stations


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
