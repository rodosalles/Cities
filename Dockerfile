# Use a oficial image from Ruby 2.7.0 
FROM ruby:2.7.0

# Define a workdir on container
WORKDIR /app

# Install all dependencies from system
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn \
    postgresql-client

# Install gem
RUN gem install bundler:2.4.19 

# Copy files Gemfile e Gemfile.lock to a container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy files to a container
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Comamnd to start the rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

