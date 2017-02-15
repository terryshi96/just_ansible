#! /bin/bash
#wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable && make && make install
cp /root/redis-stable/src/redis-trib.rb /usr/local/bin/
