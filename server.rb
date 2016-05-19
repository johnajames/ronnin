require 'sinatra'
require 'json'
require 'pry'
require 'ronin'
require 'mail'

# CI Steps
# before code is pushed individual runs code
# q's should there be a stage branch how closeley does test reflect master at the moment
# A push to push to stage branch is made
# script runs the test on the development or person local machine

# This is the workflow it's going for
# run test locally and don't push to stage unless passes
# don't create a pull-request unlss you have a passing test
# and push to stage
# no need to check for passed tests on master after this
# production needs to be able to ask current version matches current master
# if if passes tests then pull update into production
# prevents coming into office to deploy a fixed production

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
