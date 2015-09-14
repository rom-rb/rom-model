[gem]: https://rubygems.org/gems/rom-model
[travis]: https://travis-ci.org/rom-rb/rom-model
[gemnasium]: https://gemnasium.com/rom-rb/rom-model
[codeclimate]: https://codeclimate.com/github/rom-rb/rom-model
[inchpages]: http://inch-ci.org/github/rom-rb/rom-model

# ROM::Model

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

## The Plan™

This gem is built on top of existing 3rd party gems that have proven to be stable
and good-enough. Unfortunately neither Virtus nor ActiveModel do not meet certain
design requirements to be a good fit in the long term.

For that reason we're exploring how to build a better foundation for rom-model.
Specifically following initiatives are taking place:

- Exploring a lower-level validation library with great composability features
  and simple interface
- Investigating a lower-level input data sanitization/coercion library that would
  be a perfect fit for handling web forms and json input

Furthermore rom-model will be soon extended with a third extension for defining
[Algebraic Data Types](https://en.wikipedia.org/wiki/Algebraic_data_type) which
will work remarkably well with [rom-repository](https://github.com/rom-rb/rom-repository)
and its auto-mapping features.

This project will provide convenient interfaces on top of robust lower-level tools
and if it turns out to be too big we'll split it into smaller gems.

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
