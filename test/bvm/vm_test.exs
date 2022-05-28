defmodule BVM.VMTest do
  use ExUnit.Case, async: true

  alias BVM.VM

  @data <<1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>
  @big 455_867_356_320_691_211_509_944_977_504_407_603_368_685_336_676_148_488_476_287_168_130_782_727_952

  describe "push" do
    test "push1" do
      vm = VM.new()

      assert {:ok, <<2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} =
               VM.push1(@data, vm)

      assert VM.stack(vm) == [1]
    end

    test "push2" do
      vm = VM.new()

      assert {:ok, <<3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} = VM.push2(@data, vm)
      assert VM.stack(vm) == [258]
    end

    test "push3" do
      vm = VM.new()

      assert {:ok, <<4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16>>, vm} = VM.push3(@data, vm)
      assert VM.stack(vm) == [66_051]
    end

    test "push32" do
      vm = VM.new()

      assert {:ok, <<42>>, vm} = VM.push32(@data <> @data <> <<42>>, vm)
      assert VM.stack(vm) == [@big]
    end
  end
end
