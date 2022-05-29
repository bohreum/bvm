defmodule BVM.VM.Halt do
  @moduledoc """
  0x00 STOP
  0 0
  Halts execution.
  """

  def step(_data, _vm) do
    :halt
  end
end
