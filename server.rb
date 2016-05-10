require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(request.body.read)
  byebug
  puts "I got some JSON: #{push.inspect}"
end
