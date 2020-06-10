FROM ruby:2.7.1

ARG USERID
ARG GROUPID

RUN apt-get update -qq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs postgresql-client libglib2.0-dev libatk1.0-dev \
    && mkdir /app \
   && addgroup --gid ${GROUPID:-1000} --system docker \
   && adduser --uid ${USERID:-1000} --gid ${GROUPID:-1000} --home /home/docker --system docker \
   && chown docker:docker /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

WORKDIR /app

USER docker

COPY --chown=docker:docker . /app

RUN bundle install

ENTRYPOINT ["entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

EXPOSE 3000