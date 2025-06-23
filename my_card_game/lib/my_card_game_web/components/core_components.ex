defmodule MyCardGameWeb.CoreComponents do
  @moduledoc """
  Provides components that are commonly used in MyCardGameWeb templates.
  """
  use Phoenix.Component

  attr :flash, :map, required: true
  attr :id, :string, default: "flash-group" # Optional, for targeting with CSS or JS
  attr :class, :string, default: "" # Optional, for additional CSS classes

  def flash_group(assigns) do
    ~H"""
    <div id={@id} class={["fixed top-2 right-2 z-50 flex w-80 flex-col space-y-2", @class]}>
      <Phoenix.LiveView.JS
        id="flash-close-all"
        hide="transition-all transform ease-in-out duration-300"
        to={"##{@id} .flash"}
      />
      <div :for={{kind, message} <- @flash} class="flash" id={"flash-#{kind}"}>
        <div class="flex items-center justify-between rounded-lg p-3 shadow-lg">
          <div class="flex items-center">
            <span class="text-sm font-medium"><%= message %></span>
          </div>
          <button
            type="button"
            class="ml-4 flex-shrink-0 rounded-md inline-flex text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            phx-click={Phoenix.LiveView.JS.hide(to: "##{"flash-#{kind}"}")}
            aria-label="Close"
          >
            <span class="sr-only">Close</span>
            <Heroicons.x_mark solid class="h-5 w-5" />
          </button>
        </div>
      </div>
    </div>
    """
  end

  # Placeholder for Heroicons module if you were to use it directly
  # In a real app, you might install a Heroicons library or define your SVGs.
  defmodule Heroicons do
    def x_mark(assigns) do
      ~H"""
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class={assigns[:class] || "w-6 h-6"}>
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
      """
    end
  end
end
