defmodule MyCardGameWeb.Router do
  use MyCardGameWeb, :router

  import MyCardGameWeb.UserAuth # Assuming UserAuth will be added later for sessions

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MyCardGameWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug :fetch_current_user # If UserAuth is set up
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyCardGameWeb do
    pipe_through :browser

    # get "/", PageController, :home # Example if not using LiveView for root
    # live "/", GreetingLive, :index # Placeholder for a root LiveView, will adjust in later step
    live "/hello", GreetingLive, :index # Route for our new GreetingLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyCardGameWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() == :dev do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MyCardGameWeb.Telemetry
      # forward "/mailbox", Plug.Swoosh.MailboxPreview # If using Swoosh for mail
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    # If you want to use the Swoosh mailbox preview, you should put
    # it behind authentication to prevent accidental data leakage.
    # scope "/dev" do
    #   pipe_through [:fetch_session, :protect_from_forgery]
    #   forward "/mailbox", Plug.Swoosh.MailboxPreview
    # end
  end
end
