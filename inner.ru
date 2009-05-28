require 'sinatra/base'
require 'pp'

class Reloading < Sinatra::Base
  def self.at_rackup
    @at_rackup ||= Time.now
  end
  at_rackup

  def self.at_first_request
    @at_first_request ||= Time.now
  end

  get '/' do
    content_type :text
    [[:at_rackup, self.class.at_rackup],
     [:at_first_request, self.class.at_first_request],
     [:at_current_request, Time.now]].pretty_inspect
  end
end

run Reloading

# vim:filetype=ruby
