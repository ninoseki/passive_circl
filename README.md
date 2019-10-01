# passive_circl

[![Build Status](https://travis-ci.com/ninoseki/passive_circl.svg?branch=master)](https://travis-ci.com/ninoseki/passive_circl)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/passive_circl/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/passive_circl?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/passive_circl/badge)](https://www.codefactor.io/repository/github/ninoseki/passive_circl)

[CIRCL](https://www.circl.lu/) Passive DNS/SSL API wrapper for Ruby.

## Installation

```bash
gem install passive_circl
```

## Usage

```ruby
require "passive_circl"

# when given nothing, it tries to load username and password from ENV["CIRCL_PASSIVE_USERNAME] and ENV["CIRCL_PASSIVE_PASSWORD"]
api = PassiveCIRCL::API.new
# or you can set them manually
api = PassiveCIRCL::API.new(username: "USERNAME", password: "PASSWORD")

api.dns.query("www.circl.lu")

api.ssl.query("172.228.24.0/28")
api.ssl.cquery("c46fed822dadac3f31f9bb4d1a78a1d9eae4567b")
api.ssl.cfetch("7c552ab044c76d1df4f5ddf358807bfdcd07fa57")
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
