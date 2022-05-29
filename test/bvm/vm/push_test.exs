defmodule BVM.VM.PushTest do
  use ExUnit.Case, async: true

  alias BVM.VM
  alias BVM.VM.Push

  @data <<1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>
  @big 455_867_356_320_691_211_509_944_977_504_407_603_368_685_336_676_148_488_476_287_168_130_782_727_952

  test "push1" do
    vm = VM.new()

    assert {:ok, <<2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} =
             Push.step(0x60, @data, vm)

    assert VM.stack(vm) == [1]
  end

  test "push2" do
    vm = VM.new()

    assert {:ok, <<3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} =
             Push.step(0x61, @data, vm)

    assert VM.stack(vm) == [258]
  end

  test "push3" do
    vm = VM.new()

    assert {:ok, <<4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} =
             Push.step(0x62, @data, vm)

    assert VM.stack(vm) == [66_051]
  end

  test "push32" do
    vm = VM.new()

    assert {:ok, <<42>>, vm} = Push.step(0x7F, @data <> @data <> <<42>>, vm)
    assert VM.stack(vm) == [@big]
  end
end
