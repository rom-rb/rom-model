[gem]: https://rubygems.org/gems/rom-model
[travis]: https://travis-ci.org/rom-rb/rom-model
[gemnasium]: https://gemnasium.com/rom-rb/rom-model
[codeclimate]: https://codeclimate.com/github/rom-rb/rom-model
[inchpages]: http://inch-ci.org/github/rom-rb/rom-model

# rom-model

[![Gem Version](https://badge.fury.io/rb/rom-model.svg)][gem]
[![Build Status](https://travis-ci.org/rom-rb/rom-model.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/rom-rb/rom-model.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/rom-rb/rom-model/badges/gpa.svg)][codeclimate]
[![Test Coverage](https://codeclimate.com/github/rom-rb/rom-model/badges/coverage.svg)][codeclimate]
[![Inline docs](http://inch-ci.org/github/rom-rb/rom-model.svg?branch=master)][inchpages]

This is a set of extensions for PORO objects to help in data coercion and validation.
It was extracted from rom-rails and for now it uses Virtus and ActiveModel.

The package includes:

- `ROM::Attributes` for defining input attributes with types and coercion rules
- `ROM::Validator` a standalone validator object extension built on top of
  `ActiveModel::Validations` with additional features like nested validators

## Future Plans

It is very likely this gem will be deprecated. For now please consider using [dry-validation](https://github.com/dry-rb/dry-validation) along with [dry-types](https://github.com/dry-rb/dry-types) instead of rom-model. We may integrate rom-model with these libs to provide persistence-related features for dry-validation, or just abandon rom-model completely. Time will tell.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rom-model'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rom-model

## License

See `LICENSE` file.
