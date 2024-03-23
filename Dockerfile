FROM ruby:3.0

ARG NODE_VERSION=18
ARG BUNDLER_VERSION=2.4.10

RUN apt-get update -qq && \
    apt-get install -y curl gnupg2 build-essential libpq-dev && \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    gem install bundler -v ${BUNDLER_VERSION}

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock* ./
RUN yarn install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
