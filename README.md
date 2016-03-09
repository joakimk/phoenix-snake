# Snake

A multiplayer game made in a couple of hours at an elixir meetup.

## Commands used to deploy to heroku

    heroku apps:create phoenix-snake --region eu
    heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack
    heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir
    heroku config:set SECRET_KEY_BASE=$(elixir -e "IO.puts :crypto.strong_rand_bytes(64) |> Base.encode64")
    git push heroku
