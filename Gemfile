source 'https://rubygems.org'

gemspec

group :test do
  gem 'rspec'
  gem 'rom-sql', '~> 0.8'
  gem 'pg', platforms: [:mri, :rbx]
  gem 'pg_jruby', platforms: :jruby
  gem 'codeclimate-test-reporter', require: nil, platform: :rbx
end

group :tools do
  gem 'byebug', platforms: :mri
end
