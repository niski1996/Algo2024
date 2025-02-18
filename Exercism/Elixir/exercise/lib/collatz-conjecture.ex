defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if the number is odd, multiply by 3 and add 1
    - if the number is even, divide by 2
  """
  @spec calc(pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: do_calc(input, 0)
  def calc(_), do: raise FunctionClauseError

  @spec do_calc(pos_integer(), non_neg_integer()) :: non_neg_integer()
  defp do_calc(1, step), do: step

  defp do_calc(input, step) do
    if rem(input, 2) == 0 do
      do_calc(div(input, 2), step + 1)
    else
      do_calc(3 * input + 1, step + 1)
    end
  end
end
