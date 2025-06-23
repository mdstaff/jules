defmodule MyCardGameWeb.Layouts do
  use MyCardGameWeb, :html

  # This embeds all HEEx templates in this directory.
  # We will need to create these .heex files.
  embed_templates "layouts/*"

  # Fallback function definitions if .heex files are not used or for clarity.
  # Modern Phoenix relies more on the .heex files being present in
  # the `layouts` directory (e.g., `root.html.heex`, `app.html.heex`).

  # Example of how root.html.heex might be defined if not using a separate file:
  # def root(assigns) do
  #  ~H"""
  #  <!DOCTYPE html>
  #  <html lang="en">
  #    <head>
  #      <meta charset="utf-8"/>
  #      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  #      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  #      <meta name="csrf-token" content={get_csrf_token()}>
  #      <title>MyCardGame</title>
  #      <link phx-track-static rel="stylesheet" href={~p"/assets/app.css"}/>
  #      <script defer phx-track-static type="text/javascript" src={~p"/assets/app.js"}> </script>
  #    </head>
  #    <body>
  #      <.flash_group flash={@flash} />
  #      <%= @inner_content %>
  #    </body>
  #  </html>
  #  """
  # end
end
