source 'https://rubygems.org'

gemspec

gem 'rom', github: 'rom-rb/rom', branch: 'master'
gem 'rom-sql', github: 'rom-rb/rom-sql', branch: 'master'
gem 'pg'

group :tools do
  gem 'byebug', platforms: :mri
end

group :test do
  gem 'rspec'
  gem 'codeclimate-test-reporter', require: nil, platform: :rbx
end
