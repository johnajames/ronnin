require 'sinatra'
require 'json'
require 'byebug'

post '/payload' do
  push = JSON.parse(request.body.read)
  byebug
  puts "I got some JSON: #{push.inspect}"
end
