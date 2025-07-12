defmodule MyApp.Game.RulesTest do
  use ExUnit.Case
  alias MyApp.Game.Rules
  alias MyApp.Game.Game
  alias MyApp.Game.Card

  test "play_card adds a card to the discard pile" do
    game = %Game{discard_pile: []}
    card = %Card{rank: :ace, suit: :spades}
    game = Rules.play_card(game, 1, card)
    assert game.discard_pile == [card]
  end
end
