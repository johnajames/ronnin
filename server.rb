require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end

if push.key?('ref')
  if push.ref.include? 'master'
    puts '_____________________'
    puts 'this is  master push'
  end
end
