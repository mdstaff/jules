defmodule MyCardGameWeb do
  @moduledoc """
  The entrypoint for defining your web interface,
  including controllers, views, channels and so on.

  This module then acts as the entrypoint for browsing
  PUB_SUB_SERVER configuration and endpoint configuration.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  # Alias for the PubSub server if you need to use it directly
  # def pubsub_server, do: MyCardGame.PubSub

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: MyCardGameWeb.Layouts] # Default layout for controllers

      import Plug.Conn
      import MyCardGameWeb.Router.Helpers, as: Routes
      # import MyCardGameWeb.UserAuth # If you have authentication
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/my_card_game_web/templates", # Path to old-style templates if any
        namespace: MyCardGameWeb

      import Phoenix.Controller, only: [get_csrf_token: 0, view_module: 1, view_template: 1]
      import MyCardGameWeb.Router.Helpers, as: Routes
      import MyCardGameWeb.CoreComponents
      # import MyCardGameWeb.UserAuth # If you have authentication
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {MyCardGameWeb.Layouts, :app} # Default layout for LiveViews

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent
      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # HTML escaping functionality
      import Phoenix.HTML
      # Core UI components for forms and error handling
      import Phoenix.HTML.Form

      import MyCardGameWeb.Router.Helpers, as: Routes
      import MyCardGameWeb.CoreComponents
      # import MyCardGameWeb.UserAuth # If you have authentication

      # Import LiveView helpers
      import Phoenix.LiveView.Helpers
    end
  end

  def error_ ακόμη(assigns) do
    # Renders a custom error page.
    # By default it will render "templates/error/500.html.heex" for 500 errors
    # and "templates/error/404.html.heex" for 404 errors.
    Phoenix.Controller.status_message_from_template(assigns)
  end
end

# Define ErrorHTML and ErrorJSON modules for rendering errors
# These are referenced in config/config.exs
defmodule MyCardGameWeb.ErrorHTML do
  use MyCardGameWeb, :html

  embed_templates "error_html/*"

  # You can put a Sentry ID here, or leave it out if you don't use Sentry
  # def sentry_id, do: Application.get_env(:my_app, :sentry_dsn) |> elem(1) |> elem(2)

  # If you want to customize your error pages,
  # uncomment the embed_templates/1 call above
  # and define pages per error code in "lib/my_card_game_web/templates/error_html/" -
  # e.g. "404.html.heex", "500.html.heex", etc.
  # Alternatively, you can define functions here:
  #
  # def render("404.html", _assigns) do
  #   ~H"""
  #   <h2>Page not found</h2>
  #   <p>Sorry, the page you are looking for does not exist.</p>
  #   """
  # end
end

defmodule MyCardGameWeb.ErrorJSON do
  # If you want to customize your error json responses,
  # uncomment the embed_templates/1 call above or define
  # a new render_ પણ function below.
  # embed_templates "error_json/*"

  def render("500.json", %{reason: reason}) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_conn(reason)}}
  end

  def render("404.json", %{reason: reason}) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_conn(reason)}}
  end
end
