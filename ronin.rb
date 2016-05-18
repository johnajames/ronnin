class Ronin
  def push(repository)
    # we are going to merge the development branch into master
    `git checkout master`
    `git merge development`
    # if conflicts send message script
    # how to handle if conflicts arise
    `git push origin master`
  end


end
