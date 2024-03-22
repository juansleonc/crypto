FROM ruby:3.0

RUN apt-get update -qq && \
    apt-get install -y curl gnupg2 build-essential libpq-dev && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler -v '2.4.10'

WORKDIR /app

RUN npm install @babel/plugin-proposal-private-methods --save
RUN npm install @babel/plugin-proposal-private-property-in-object --save

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.4.10 && bundle install

COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
