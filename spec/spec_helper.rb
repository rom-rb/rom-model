if RUBY_ENGINE == 'rbx'
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require 'rom-model'
require 'rom-sql'

begin
  require 'byebug'
rescue LoadError
end

DB_URI = ENV.fetch('DB_URI', 'postgres://localhost/rom_model')

root = Pathname(__FILE__).dirname

Dir[root.join('support/*.rb').to_s].each do |f|
  require f
end

Dir[root.join('shared/*.rb').to_s].each do |f|
  require f
end

I18n.load_path << [root.join('../config/locales/en.yml').realpath]

RSpec.configure do |config|
  config.order = "random"
end
