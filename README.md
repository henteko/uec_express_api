# UecExpressApi

API library of the University of Electro-Communications class cancellation information.

## Installation

Add this line to your application's Gemfile:

    gem 'uec_express_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uec_express_api

## example

```example.rb
#!/usr/bin/ruby
require 'rubygems'
require 'uec_express_api'
require 'json'

uec_express_faculty = UECExpressApi.new() #=> Faculty of Information
uec_express_faculty.to_s
puts uec_express_faculty.to_hash.to_json

uec_express_gs = UECExpressApi.new() #=> Graduate school of Information
uec_express_gs.to_s
puts uec_express_gs.to_hash.to_json
```

##License and copyright
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
