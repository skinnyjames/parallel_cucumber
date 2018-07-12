FROM ruby:2.2

ARG GRID_IP
ARG NODES

#RUN apt-get update
#RUN apt-get install -y python-software-properties python g++ make
#RUN apt-get install -y bash curl git patch bzip2 build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev libcurl3-dev imagemagick libmagickwand-dev libpcre3-dev
#RUN apt-get install -y wget
#RUN apt-get install -y nodejs
#RUN apt-get install -y git
#RUN apt-get install -y curl
#RUN apt-get install -y unzip
#RUN apt-get install -y android-tools-adb
#RUN apt-get install -y openjdk-7-jre-headless lib32z1 lib32ncurses5 g++-multilib
#RUN apt-get install -y vim
#RUN apt-get install -y npm
#
#ENV PHANTOMJS_VERSION 1.9.7
#
#RUN \
#  apt-get update && \
#  apt-get upgrade -y && \
#  apt-get install -y git wget libfreetype6 libfontconfig bzip2 && \
#  mkdir -p /srv/var && \
#  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
#  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
#  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
#  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
#  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
#  git clone https://github.com/n1k0/casperjs.git /srv/var/casperjs && \
#  ln -s /srv/var/casperjs/bin/casperjs /usr/bin/casperjs && \
#  apt-get autoremove -y && \
#  apt-get clean all

RUN gem install cucumber phantomjs bundler nokogiri selenium-webdriver rake  redcarpet rubocop cuke_sniffer json rspec relish parallel_tests chromedriver-helper


# Define working directory.
WORKDIR /myapp

ADD . /myapp


RUN bundle install

# run 'docker build --build-arg GRID_IP=<ip> -t parallel_cucumber .' in jenkins
RUN bundle exec parallel_cucumber features/ -m $NODES -o IP=$GRID_IP


RUN ls

