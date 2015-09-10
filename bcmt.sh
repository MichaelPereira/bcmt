#!/bin/bash

source resources/user.sh
source resources/group.sh
source resources/file.sh
#source resources/folder.sh
#source resources/webserver.sh

user "john"

group "dev"

file "toto"

folder "/tmp/folder"

webserver "apache2"