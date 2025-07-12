defmodule MyApp.Game.DeckTest do
  use ExUnit.Case
  alias MyApp.Game.Deck

  test "new deck has 52 cards" do
    deck = Deck.new()
    assert length(deck) == 52
  end

  test "shuffling changes the order of the deck" do
    deck = Deck.new()
    shuffled_deck = Deck.shuffle(deck)
    refute deck == shuffled_deck
  end

  test "dealing returns the correct number of hands and cards" do
    deck = Deck.new()
    {hands, _rest_of_deck} = Deck.deal(deck, 4, 5)
    assert length(hands) == 4
    assert length(hd(hands)) == 5
  end
end
