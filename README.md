# UecExpressApi

API library of the University of Electro-Communications class cancellation information.

## Installation

Add this line to your application's Gemfile:

    gem 'uec_express_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uec_express_api

## Usage

```example.rb
#!/usr/bin/ruby
require 'rubygems'
require 'uec_express_api'

uec_express = UECExpressApi.new()
uec_express.to_s
puts uec_express.to_json
```

