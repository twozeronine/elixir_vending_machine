defmodule ElixirVendingMachineTest do
  use ExUnit.Case
  doctest ElixirVendingMachine

  test "greets the world" do
    assert ElixirVendingMachine.hello() == :world
  end
end
