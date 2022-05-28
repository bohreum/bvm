defmodule BVM do
  @moduledoc """
  Documentation for `BVM`.
  """

  defdelegate new(), to: BVM.VM
end
