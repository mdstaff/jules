# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

import Config

# Note: Since --no-ecto was used, ecto_repos is empty.
# If Ecto were used, it would be:
# config :my_card_game, ecto_repos: [MyCardGame.Repo]

# Configure Phoenix Endpoint
config :my_card_game, MyCardGameWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: MyCardGameWeb.ErrorHTML, json: MyCardGameWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MyCardGame.PubSub,
  live_view: [signing_salt: "CHANGE_ME_IN_PROD"] # Replace with a secure salt in prod

# Configure Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
