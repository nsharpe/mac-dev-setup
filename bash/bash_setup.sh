#!/bin/bash

#  Example replace line that starts with alias
# sed -i "/alias=/c\alias=newvalue" your_file_here

sed -i "/export JAVA_HOME=/c\export JAVA_HOME=/"$(//usr//libexec//java_home -v 1.8)/"" ~/.bash_profile
