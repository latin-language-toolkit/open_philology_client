# OpenPhilologyClient
[![Build Status](https://travis-ci.org/Christof/open_philology_client.png)](https://travis-ci.org/Christof/open_philology_client)
[![Coverage Status](https://coveralls.io/repos/Christof/open_philology_client/badge.png)](https://coveralls.io/r/Christof/open_philology_client)
[![Dependency Status](https://gemnasium.com/Christof/open_philology_client.png)](https://gemnasium.com/Christof/open_philology_client)

Client for the APIs of open philology projects like Perseus and Perseids.

## Installation

Add this line to your application's Gemfile:

    gem 'open_philology_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_philology_client

## Usage
### Morphology
```ruby
morphology = OpenPhilologyClient::Morphology.new
morphology.analyse_word("latin_word_to_analyse")
```
To provide a custom base url use:
```ruby
morphology = OpenPhilologyClient::Morphology.new('base url')
```
The return value of `analyse_word` is a nested dictionary.
If the word is not found `nil` is returned.

The documentation for the morphological analysis service can be found
[here](https://wikihub.berkeley.edu/display/pbamboo/Morphological+Analysis+Service+Contract+Description+-+v1.1.1).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
