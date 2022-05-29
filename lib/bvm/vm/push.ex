defmodule BVM.VM.Push do
  @moduledoc """
  0x60 - 0x7f PUSHx
  0 1
  Place 1 value on the stack.
  """

  @push_ops_sizes [
    {0x60, 8},
    {0x61, 16},
    {0x62, 24},
    {0x63, 32},
    {0x64, 40},
    {0x65, 48},
    {0x66, 56},
    {0x67, 64},
    {0x68, 72},
    {0x69, 80},
    {0x6A, 88},
    {0x6B, 96},
    {0x6C, 104},
    {0x6D, 112},
    {0x6E, 120},
    {0x6F, 128},
    {0x70, 136},
    {0x71, 144},
    {0x72, 152},
    {0x73, 160},
    {0x74, 168},
    {0x75, 176},
    {0x76, 184},
    {0x77, 192},
    {0x78, 200},
    {0x79, 208},
    {0x7A, 216},
    {0x7B, 224},
    {0x7C, 232},
    {0x7D, 240},
    {0x7E, 248},
    {0x7F, 256}
  ]

  for {op, size} <- @push_ops_sizes do
    def step(unquote(op), <<val::size(unquote(size))-integer-unsigned-big, rest::bitstring>>, vm) do
      {:ok, rest, Map.update!(vm, :stack, &[val | &1])}
    end
  end
end
