defmodule BVM.VM do
  @moduledoc """
  Virtual Machine
  """

  alias BVM.VM.Add
  alias BVM.VM.Halt
  alias BVM.VM.Push

  def new do
    %{stack: []}
  end

  def stack(%{stack: stack}) do
    stack
  end

  def with_stack(vm, stack) do
    Map.put(vm, :stack, stack)
  end

  def run(data, vm) do
    case step(data, vm) do
      {:ok, data, vm} -> run(data, vm)
      {:error, reason} -> {:error, reason}
      :halt -> :ok
    end
  end

  def step(<<0x00, data::binary>>, vm), do: Halt.step(data, vm)
  def step(<<0x01, data::binary>>, vm), do: Add.step(data, vm)

  def step(<<op, data::binary>>, vm) when op >= 0x60 and op <= 0x7F do
    Push.step(op, data, vm)
  end
end
