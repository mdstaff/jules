defmodule MyCardGameWeb.GreetingLive do
  use MyCardGameWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # This callback is executed when the LiveView is first mounted.
    # We assign an initial message to the socket.
    # This message will be available in the render function.
    socket = assign(socket, :message, "Hello from LiveView!")
    socket = assign(socket, :page_title, "Greeting Page") # For the layout title
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    # This function is responsible for rendering the LiveView's HTML.
    # It uses the ~H sigil for HEEx (HTML+EEx) templates.
    # The @message assign from mount/3 is interpolated here.
    ~H"""
    <div class="container">
      <header>
        <h1>LiveView Greeting</h1>
      </header>
      <section>
        <p class="text-2xl text-blue-600 py-4"><%= @message %></p>
        <button phx-click="say_hello" class="button primary">Say Hello!</button>
      </section>
    </div>
    """
  end

  # Handle the "say_hello" event triggered by the button click
  @impl true
  def handle_event("say_hello", _payload, socket) do
    # When the button is clicked, update the message
    new_message = "Hello again, LiveView User! You clicked the button."
    socket = assign(socket, :message, new_message)
    {:noreply, socket}
  end
end
