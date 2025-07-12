defmodule MyApp.Game.CardTest do
  use ExUnit.Case
  alias MyApp.Game.Card

  test "can create a card" do
    card = %Card{rank: :ace, suit: :spades}
    assert card.rank == :ace
    assert card.suit == :spades
  end
end
