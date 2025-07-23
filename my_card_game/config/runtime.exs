import Config

# config/runtime.exs is executed for all environments, often to load
# environment variables. Supports dynamic configuration.
#
# For example, you can define a PORT variable in your environment
# and use it to configure your Endpoint port defined in Endpoint:
#
#     port = System.get_env("PORT") || 4000
#
#     config :my_card_game, MyCardGameWeb.Endpoint, http: [port: port]
#
# Or you can load secrets from a file:
#
#     config :my_card_game, key: Config.read_secret("some_secret_file.txt")
#
# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per host:
#
#     host = System.get_env("HOST") || "local"
#     import_config "#{host}.exs"
#
# Remember to create "local.exs" and other files if you use this pattern.
if config_env() == :prod do
  # Example: Set a production secret key base from an environment variable
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  config :my_card_game, MyCardGameWeb.Endpoint,
    secret_key_base: secret_key_base

  # SSL Configuration (example for prod)
  # port = String.to_integer(System.get_env("PORT") || "4000")
  # config :my_card_game, MyCardGameWeb.Endpoint,
  #   url: [host: System.get_env("PHX_HOST") || "example.com", port: 443, scheme: "https"],
  #   http: [
  #     # Enable IPv6 and bind to all interfaces.
  #     # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
  #     ip: {0, 0, 0, 0, 0, 0, 0, 0},
  #     port: port
  #   ],
  #   secret_key_base: secret_key_base

  # ## Using releases
  #
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:
  # config :my_card_game, MyCardGameWeb.Endpoint, server: true
  #
  # Then you can assemble a release by calling `mix release`.
  # See `mix help release` for more information.
end
