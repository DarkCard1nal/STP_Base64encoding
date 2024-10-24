# Base64encoding

_Created for the course "Stack of programming technologies" V. N. Karazin Kharkiv National University_

Ruby 3.3.5 [Base64encoding](https://rubygems.org/gems/Base64encoding) gem.

---

A gem for Base64 encoding and decoding.

This gem has methods:

- `encode_base64` - method that encodes UTF-8 strings to base64 (UTF-8) string
- `decode_base64` - method that decodes base64 string to UTF-8 string.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add Base64encoding
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install Base64encoding
```

## Usage

```ruby
require 'Base64encoding'

push(Base64encoding.encode_base64('Hello, World!'))
# "SGVsbG8sIFdvcmxkIQ=="

push(Base64encoding.decode_base64('SGVsbG8sIFdvcmxkIQ=='))
# "Hello, World!"
```
