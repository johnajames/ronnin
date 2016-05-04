"""
This is the ronnin CI tool.
Ronnin is lean, fast, and simple.
It is mean to be a lean alternative
to other CI tools. Ronnin is a command-line utility. That can work
with any code base. Like the name implies Ronnin has no lord or master
but comes from a life of service.
"""
def get_github_info():
    repo = raw_input("enter the github repo url")
    username = raw_input("enter a github username")
    password = raw_input("enter a github password")
    return (repo, username, password)

def main():
    get_github_info()
    # get repo information logon password
    # new code identification
    # pull new code
    # run test build
    # record log
    # if build successful deploy to production server
    # delete log
    # if build fails halt and send email with log file
    # user re-runs build tool





if __name__ == "__main__":
    main()
