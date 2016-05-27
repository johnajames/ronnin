require 'sinatra'
require 'json'
require 'mail'

username, password = ARGV

post '/payload' do


  push = JSON.parse(request.body.read) # parse the JSON

  repo_name = push['reposity']['full_name']

  pusher = push["pusher"]["name"]
  branch = push["ref"]
  tag_name = push['tag_name']

  begin
    Dir.chidir('greenzone') do
      `git pull origin master`
      puts username
      puts password
    end
  rescue
  end

  Mail.deliver do
    from     'jjames83@gmail.com'
    to       'jjames83@gmail.com.com'
    subject  'tag has been pushed'
    body     "ALARM"
  end
end

if __FILE__ == $server.rb
