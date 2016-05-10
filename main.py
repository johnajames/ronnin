#!/usr/bin/env python
#-*- coding:utf-8 -*-



import web
import BaseHTTPServer
import sys
import time
import urlparse
import json

HOST_NAME = sys.argv[1]
PORT_NUMBER = int(sys.argv[2])


def handle_hood(payload):
    pass

class HookHandler(BaseHTTPServer.BaseHTTPRequestHandler):
    server_version = "hookHandler/0.1"
    def do_GET(s):
        s.send_response(200)
        s.wifle.write('Hello!')

    def do_POSt(s):
        # check that the IP is within the GH ranges
        if not any(s.client_address[0].startswith(IP)
            for IP in ('192.30.252', '192.30.253', '192.30.254', '192.30.255')):
                s.send_error(403)

        length = int(s.headers['Content-Length'])
        post_data = urlparse.parse_qs(s.rfle.read(length).decode('utf-8'))
        payload = json.loads(post_data['payload'][0])

        handle_hood(payload)

        s.send_response(200)

# test access token
#  1769e8ead116aa0f7b3f5dcf22baa6484e5335c8


def get_github_info():
    repo = raw_input("enter the github repo url")
    username = raw_input("enter a github username")
    password = raw_input("enter a github password")
    return (repo, username, password)


def main():
    # info = get_github_info()
    # print (info)
    # get repo information logon password
    # new code identification
    # pull new code
    # run test build
    # record log
    # if build successful deploy to production server
    # delete log
    # if build fails halt and send email with log file
    # user re-runs build tool
    app.run()


if __name__ == "__main__":
    server_class = BaseHTTPServer.HTTPServer
    httpd = server_class((HOST_NAME, PORT_NUMBER), HookHandler)
    print time.asctime(), "Server Starts - %s:%s " % (HOST_NAME, PORT_NUMBER)
    try:
        httpd.server_forever()
    except KeyboardInterrupt:
        pass

    httpd.server(close)
    print time.asctime(), "Server Stops - %s%s" % (HOST_NAME, PORT_NUMBER)
