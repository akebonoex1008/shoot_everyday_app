FROM ruby:2.6.3
RUN apt-get update -qq &&  \
    apt-get install --no-install-recommends -y nodejs postgresql-client && \
    apt-get install -y vim

ENV APP_DIR /app

RUN mkdir /app
WORKDIR $APP_DIR
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN mkdir -p tmp/sockets

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

