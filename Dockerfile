FROM ruby:2.6.5

WORKDIR /app
EXPOSE 9292

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle --deployment --jobs 8 --retry 5 --path vendor/cache

COPY ./ /app

CMD bundle exec rackup --host=0.0.0.0 --port=9292 --env=production
