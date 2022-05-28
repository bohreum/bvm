defmodule BVM.VM do
  @moduledoc """
  Virtual Machine
  """

  def new do
    %{stack: []}
  end

  def stack(%{stack: stack}) do
    stack
  end

  @push_ops_sizes [
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    64,
    72,
    80,
    88,
    96,
    104,
    112,
    120,
    128,
    136,
    144,
    152,
    160,
    168,
    176,
    184,
    192,
    200,
    208,
    216,
    224,
    232,
    240,
    248,
    256
  ]

  for {size, ii} <- Enum.with_index(@push_ops_sizes) do
    def unquote(String.to_atom("push#{ii + 1}"))(
          <<val::size(unquote(size))-integer-unsigned-big, rest::bitstring>>,
          %{stack: stack} = vm
        ) do
      {:ok, rest, %{vm | stack: [val | stack]}}
    end
  end
end
