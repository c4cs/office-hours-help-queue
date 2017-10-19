FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

RUN mkdir /usr/src/eecshelp
WORKDIR /usr/src/eecshelp
ADD . /usr/src/eecshelp

RUN bundle install

ENTRYPOINT bundle exec puma -C /usr/src/eecshelp/config/puma.rb
