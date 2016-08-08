# 0.4.0 2016-08-08

## Changed

* Updated dependencies to work with Rails 5
* [break] Drop support for ruby 2.1

[Compare v0.3.0...v0.4.0](https://github.com/rom-rb/rom-model/compare/v0.3.0...v0.4.0)

# 0.3.0 2016-07-27

## Changed

* Updated to work with rom 2.0

[Compare v0.2.0...v0.3.0](https://github.com/rom-rb/rom-model/compare/v0.2.0...v0.3.0)

# 0.2.0 2016-01-06

## Added

* Validators support `>>` pipeline operator (cflipse)

[Compare v0.1.1...v0.2.0](https://github.com/rom-rb/rom-model/compare/v0.1.1...v0.2.0)

# 0.1.1 2015-08-19

## Added

- Embedded validator has access to `root` node of the input attributes (solnic)
- Embedded validator has access to `parent` node of the input attributes (solnic)
- Presence validation for embedded validation can be skipped with `presence: false` option (solnic)

## Fixed

- `set_model_name` is correctly set for embedded validators (solnic)

[Compare v0.1.0...v0.1.1](https://github.com/rom-rb/rom-model/compare/v0.1.0...v0.1.1)

# 0.1.0 2015-08-14

Extracted code from rom-rails 0.5.0
