#!/bin/sh

# enable console colors
sed -i '1iforce_color_prompt=yes' ~/.bashrc

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# basic prereqs
sudo apt-get update
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libcurl4-openssl-dev curl wget

# SQLite, Git and Node.js
sudo apt-get install -y sqlite3 libsqlite3-0 libsqlite3-dev git tig nodejs

# Vim and tmux
sudo apt-get install -y vim-gtk tmux

# Qt for Capybara Webkit
sudo apt-get install -y libqtwebkit-dev

# ImageMagick
sudo apt-get install -y imagemagick

# Postgres
sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
sudo apt-get install -y postgresql postgresql-contrib libpq-dev

# Memcached
sudo apt-get install -y memcached

# Redis
sudo apt-get install -y redis-server

# setup rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ruby 2.1.3 and bundler
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
export PATH="${RBENV_ROOT}/shims:${PATH}"
rbenv install 2.1.3
rbenv global 2.1.3
gem install bundler rails && rbenv rehash

#create postgres user
sudo -u postgres createuser vagrant -s

#create basic git configuration - still need to generate keys
git config --global color.ui true
git config --global user.name "zevans"
git config --global user.email "zwevans@gmail.com"

# cleanup
sudo apt-get clean
