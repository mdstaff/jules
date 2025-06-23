defmodule MyCardGameWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :my_card_game

  # The session will be stored in the cookie and signed,
  # so client-side JavaScript can read the session cookie.
  #
  # Note that this only applies to Phoenix Controllers,
  # LiveView uses Phoenix.LiveView.Socket for PIDs and session state.
  @session_options [
    store: :cookie,
    key: "_my_card_game_key",
    signing_salt: "PUT_A_VERY_LONG_AND_SECURE_SALT_HERE", # CHANGEME
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static assets from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :my_card_game,
    gzip: false,
    only: MyCardGameWeb.static_paths()

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :my_card_game # Only if Ecto is used
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug MyCardGameWeb.Router
end
