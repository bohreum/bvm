defmodule BVMTest do
  use ExUnit.Case
  doctest BVM

  test "greets the world" do
    assert BVM.hello() == :world
  end
end
