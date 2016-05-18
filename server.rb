require 'sinatra'
require 'json'
require 'pry'
require 'ronin'
require 'mail'

post '/payload' do
  push = JSON.parse(request.body.read)
  # lets gather the data we want and store them in variables
  pusher = push["pusher"]["name"]
  branch = push["ref"]

  # get a list of all the files touched
  files = push["commits"].map do |commit|
    commit['added'] + commit['modified'] + commit['removed']
  end
  files.flatten.uniq

  # check our criteria
  if branch == 'stage' or branch == 'master'
    Mail.deliver do
      # a daemon e-mail account
      from 'test@wm.com'
      to 'jbenne@wm.com'
      subject "updated are currently staged and ready to be tested"
      body "The following have been modified #{files}"
    end
  end
  puts "I got some JSON: #{push.inspect}"
end
