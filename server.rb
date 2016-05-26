require 'sinatra'
require 'json'
require 'mail'

# CI Steps
# This is the workflow it's going for
# push to master only if all tests for your project are passing
# don't create a pull-request unlss you have a passing test
# no need to check for passed tests on master after this
# production needs to be able to ask current version matches current master
# if if passes tests then pull update into production
# prevents coming into office to deploy a fixed production

# In order to facilitate the requirements of the project we are going to
# begin using a tagging facilities in git to help our lean ci tool know what new
# code being pushed
# is ready to be merged and pulled into production
# after the aforementioned steps are complete the user updated the tag and
# executed the git commands

post '/payload' do
  current_tag = `git tag`
  push = JSON.parse(request.body.read)
  # lets gather the data we want and store them in variables
  # every event is monitored so all you have to do is change the tag
  # pusher = push["pusher"]["name"]
  new_tag = push['tag_name']

  # check our criteria
  if current_tag != new_tag
    # move into directory of the project
    begin
      Dir.chidir('../greenzone') do
        process_id = `lsof -wni tcp:8000`
        `kill -9 process_id`
        `git pull origin master`
        `echo username`
        `yes`
        `echo password`
        `yes`
        `/manage collectstatic`
        `./manage migrate`
        `uwsgi_python27 --reload io.pid`
      end
    rescue
      puts 'could not access directory'
    end
  end

    # Mail.deliver do
    #   # a daemon e-mail account
    #   from 'test@wm.com'
    #   to 'jbenne@wm.com'
    #   subject "updated are currently staged and ready to be tested"
    #   body "The following have been modified #{files}"
    # end
    puts "I got some JSON: #{push.inspect}"
end
