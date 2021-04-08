#!/bin/bash
set -eux

tar xvjf /tmp/small_accidents.tar.bz2 -C /tmp
mongorestore --drop --db accidents /tmp/small_accidents
rm -rf /tmp/tmpdatafiles
