#!/bin/env python

# ftplist.py
# traversal ftp to get its file list
# Author: Allen Fang <iamfy000@gmail.com>

from ftplib import FTP

ftp=FTP()

SERVER_IP="0.0.0.0"
PORT="21"
USER_NAME="user_name"
PASSWORD="password"

ftp.connect(SERVER_IP, PORT)
ftp.login(USER_NAME, PASSWORD)

# starting folder
folder_set = ["/"]

while len(folder_set):
    base_name = folder_set.pop()
    print base_name
    ftp.cwd(base_name)
    items = []
    ftp.dir("", items.append)
    for item in items:
        idx = item.rfind(" ")
        name = item[idx+1:]
        if item.find("<DIR>") != -1:
            folder_set.append("%s/%s" % (base_name, name))
        else:
            print "%s/%s" % (base_name, name)


