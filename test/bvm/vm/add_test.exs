defmodule BVM.VM.AddTest do
  use ExUnit.Case, async: true

  alias BVM.VM
  alias BVM.VM.Add

  test "adding numbers" do
    vm = VM.new() |> VM.with_stack([12, 30, 69])

    assert {:ok, <<42>>, vm} = Add.step(<<42>>, vm)
    assert VM.stack(vm) == [42, 69]
  end

  test "trying to add numbers" do
    vm = VM.new() |> VM.with_stack([])

    assert {:error, "unable to add"} = Add.step(<<42>>, vm)
  end
end
