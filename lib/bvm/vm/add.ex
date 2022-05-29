defmodule BVM.VM.Add do
  @moduledoc """
  0x01 ADD
  2 1
  Addition operation.
  """

  def step(data, %{stack: stack} = vm) do
    case stack do
      [a, b | stack] ->
        {:ok, data, %{vm | stack: [a + b | stack]}}

      _ ->
        {:error, "unable to add"}
    end
  end
end
