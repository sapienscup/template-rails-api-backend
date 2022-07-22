# Dockerfile development version
FROM ruby:2.7.2 AS walrus-development

ARG USER_ID

ARG GROUP_ID

RUN addgroup --gid $GROUP_ID apiuser

RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID apiuser

ENV INSTALL_PATH /opt/app

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update ; \
    apt-get install -yq --no-install-recommends gcc make libjemalloc2 ; \
    rm -rf /var/lib/apt/lists/*

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY . /opt/app

RUN gem install rails bundler

RUN bundle install

COPY . /opt/app

RUN chown -R apiuser:apiuser /opt/app

USER $USER_ID

CMD bundle exec unicorn -c config/unicorn.rb
