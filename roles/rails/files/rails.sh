#! /bin/bash
ruby_version="2.3.1"
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
#source /home/user/.profile

#source /home/user/.rvm/scripts/rvm
echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

rvm install $ruby_version

rvm use $ruby_version --default
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

gem install bundler
gem install redis
