FROM ruby:3.1.0-alpine AS build

RUN apk add \
  build-base \
  postgresql-dev

RUN gem install bundler -v 2.3.19

COPY Gemfile* .

RUN bundle install

FROM ruby:3.1.0-alpine AS runner

RUN apk add \
    tzdata \
    nodejs \
    postgresql-dev

WORKDIR /app

 # We copy over the entire gems directory for our builder image, containing the already built artifact
COPY --from=build /usr/local/bundle/ /usr/local/bundle/

COPY . .

EXPOSE 3000

RUN RAILS_ENV=production rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
