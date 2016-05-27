require 'sinatra'
require 'json'
require 'mail'

post '/payload' do
  push = JSON.parse(request.body.read) # parse the JSON

  tags_list = `git tag`.split("\n")
  current_tag = tags_list.last.to_f
  tag_name = push['tag_name'].to_f

  if tag_name > current_tag
    Dir.chidir('io') do
      # requires ssh
      `git pull origin master`
      `./manage collectstatic`
      `./manage migate`
      `uwsgi_python27 --reload io.pid`
    end

  end

  Mail.deliver do
    from     'jjames83@gmail.com'
    to       'jjames83@gmail.com.com'
    subject  'tag has been pushed'
    body     "ALARM"
  end
end
