require 'shotgun'

rackup_file = File.dirname(__FILE__) + '/inner.ru'
if ENV["RACK_ENV"] == "development"
  app = Shotgun.new(rackup_file)
else
  config = File.read(rackup_file)
  app = eval "Rack::Builder.new {( #{config}\n )}.to_app", nil, rackup_file
end
run app

# vim:filetype=ruby
