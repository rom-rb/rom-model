source 'https://rubygems.org'

gemspec

gem 'rom', github: 'rom-rb/rom', branch: 'master'
gem 'rom-sql', github: 'rom-rb/rom-sql', branch: 'master'
gem 'rom-support', github: 'rom-rb/rom-support', branch: 'master'
gem 'rom-mapper', github: 'rom-rb/rom-mapper', branch: 'master'
gem 'transproc', github: 'solnic/transproc', branch: 'master'
gem 'pg', platforms: [:mri, :rbx]
gem 'pg_jruby', platforms: :jruby

group :tools do
  gem 'byebug', platforms: :mri
end

group :test do
  gem 'rspec'
  gem 'codeclimate-test-reporter', require: nil, platform: :rbx
end
