# See https://hub.docker.com/_/ruby.
FROM ruby:alpine

WORKDIR /usr/src/app

COPY docker-resources-ruby/Gemfile ./
RUN bundle install

COPY ./docker-resources-ruby .

CMD ["ruby", "./generate-jwt.rb"]
