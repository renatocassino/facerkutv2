FROM elixir:1.5.0

RUN mkdir /app
WORKDIR /app

ADD mix.exs /app/mix.exs
ADD mix.lock /app/mix.lock
RUN mix local.hex --force

RUN mix deps.get
RUN mix local.hex --force

ADD . /app
