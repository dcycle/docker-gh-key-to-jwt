# See https://hub.docker.com/_/ruby.
FROM ruby:alpine

WORKDIR /usr/src/app

COPY docker-resources/Gemfile ./
RUN bundle install

COPY ./docker-resources .

CMD ["ruby", "./generate-jwt.rb"]
