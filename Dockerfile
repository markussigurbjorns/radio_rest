FROM elixir:slim

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y inotify-tools nodejs

WORKDIR /code

RUN useradd -c 'phoenix user' -m -d /home/pho -s /bin/bash pho && \
    chown -R pho.pho /code
USER pho

# install the Phoenix Mix archive
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez && \
    mix local.hex --force \
    && mix local.rebar --force

ENV HOME /home/pho

