require 'shotgun'

rackup_file = File.dirname(__FILE__) + '/inner.ru'
reloading_app = Shotgun.new(rackup_file)
config = File.read(rackup_file)
inner_app = eval "Rack::Builder.new {( #{config}\n )}.to_app", nil, rackup_file

if ENV["RACK_ENV"] == "development"
  map "/reloading/" do
    run reloading_app
  end
end

map "/" do
  run inner_app
end

# vim:filetype=ruby
