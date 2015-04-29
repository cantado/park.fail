#!/usr/bin/env bash

source /home/vagrant/.rvm/scripts/rvm

gem install rails --no-ri --no-rdoc
gem install rubygems-bundler --no-ri --no-rdoc
gem install guard --no-ri --no-rdoc
gem regenerate_binstubs

(cd /home/vagrant/harald; bundle install)
(cd /home/vagrant/harald; rake db:migrate)

