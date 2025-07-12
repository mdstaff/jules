defmodule MyApp.Game.GameTest do
  use ExUnit.Case
  alias MyApp.Game.Game

  test "can create a game" do
    game = %Game{players: [], deck: [], discard_pile: [], current_turn: nil, game_phase: :setup}
    assert game.players == []
    assert game.deck == []
    assert game.discard_pile == []
    assert game.current_turn == nil
    assert game.game_phase == :setup
  end
end
