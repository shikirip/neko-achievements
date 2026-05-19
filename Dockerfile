FROM elixir:1.14.5-otp-25-alpine
RUN apk add git make
WORKDIR /app
COPY . .
ENV MIX_ENV="prod"
RUN mix local.hex --force && mix local.rebar --force
RUN MIX_ENV=prod mix deps.get --only prod
RUN MIX_ENV=prod mix compile
EXPOSE 4000
CMD ["mix", "run", "--no-halt"]
