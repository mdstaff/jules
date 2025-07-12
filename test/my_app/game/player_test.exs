defmodule MyApp.Game.PlayerTest do
  use ExUnit.Case
  alias MyApp.Game.Player

  test "can create a player" do
    player = %Player{id: 1, name: "Alice", hand: [], score: 0}
    assert player.id == 1
    assert player.name == "Alice"
    assert player.hand == []
    assert player.score == 0
  end
end
