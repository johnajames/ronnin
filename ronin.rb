class Ronin
  def initialize(username, password)
    @username = username
    @password = password
  end

  def push(repository)
    `git push`
  end

  def pull(repository)
    `git pull`
  end

  def send_message
  end

  def run_test
    `python functional_test.py`
  end


end
