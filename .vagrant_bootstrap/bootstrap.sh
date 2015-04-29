# The ouput of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    sudo apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
sudo apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential
install 'tcl8.5' tcl8.5
install 'redis-server'
install 'pandoc'

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createuser --superuser harald
sudo -u postgres psql -U postgres -d postgres -c "alter user harald with password 'harald';"

sudo -u postgres createdb -O harald harald_prototype_development
sudo -u postgres createdb -O harald harald_prototype_test
sudo -u postgres createdb -O harald harald_prototype_production


install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'ExecJS runtime' nodejs

# Docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# RVM
curl -sSL https://get.rvm.io | bash
source ~/.profile
(rvm install 2.1.5)
(rvm use 2.1.5)

# Redis
wget http://download.redis.io/releases/redis-2.8.9.tar.gz
tar xzf redis-2.8.9.tar.gz
cd redis-2.8.9
make
make test
sudo make install
cd utils
sudo ./install_server.sh
sudo update-rc.d redis_6379 defaults


# Needed for docs generation.
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8


echo 'all set, rock on!'
