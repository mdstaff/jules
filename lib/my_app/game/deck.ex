defmodule MyApp.Game.Deck do
  alias MyApp.Game.Card

  @ranks [:ace, :king, :queen, :jack, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  @suits [:spades, :hearts, :diamonds, :clubs]

  @doc """
  Creates a standard 52-card deck.
  """
  def new() do
    for suit <- @suits, rank <- @ranks do
      %Card{rank: rank, suit: suit}
    end
  end

  @doc """
  Shuffles the deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Deals a specified number of cards to a specified number of players.
  """
  def deal(deck, num_players, num_cards) do
    {hands, rest_of_deck} =
      Enum.reduce(1..num_players, {[], deck}, fn _, {hands, current_deck} ->
        {hand, next_deck} = Enum.split(current_deck, num_cards)
        {[hand | hands], next_deck}
      end)

    {Enum.reverse(hands), rest_of_deck}
  end
end
