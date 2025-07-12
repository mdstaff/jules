defmodule MyApp.Game.Rules do
  alias MyApp.Game.Game
  alias MyApp.Game.Card

  @doc """
  Plays a card from a player's hand.
  This is a simple example and would need to be expanded with real game logic.
  """
  def play_card(%Game{} = game, _player_id, %Card{} = card) do
    # In a real game, you would validate the move, update the player's hand,
    # add the card to the discard pile, and potentially update the scores
    # or the current turn.
    new_discard_pile = [card | game.discard_pile]
    %{game | discard_pile: new_discard_pile}
  end
end
