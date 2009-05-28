time = Time.now

app = lambda do |env|
  [200, {}, [time.to_s]]
end
run app

# vim:filetype=ruby
