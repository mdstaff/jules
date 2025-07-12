defmodule MyApp.Game.Game do
  @moduledoc """
  Represents the overall state of a game.
  """
  defstruct [:players, :deck, :discard_pile, :current_turn, :game_phase]
end
