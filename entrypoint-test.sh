#!/bin/bash
set -e

mongod --fork --logpath /var/log/mongodb.log --logappend
rake db:mongoid:drop

exec "$@"
