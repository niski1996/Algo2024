defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2.
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      input_base < 2 -> {:error, "input base must be >= 2"}
      output_base < 2 -> {:error, "output base must be >= 2"}

      true ->
        case to_decimal(digits, input_base) do
          {:error, _} -> {:error, "all digits must be >= 0 and < input base"}
          {:ok, number} -> {:ok, from_decimal(number, output_base)}
        end
    end
  end

  defp to_decimal([], _), do: {:ok, 0}
  defp to_decimal([head | tail], base) when head < base and head >= 0 do
    case to_decimal(tail, base) do
      {:error, _} = error -> error
      {:ok, rest} -> {:ok, head * trunc(:math.pow(base, Enum.count(tail))) + rest}
    end
  end
  defp to_decimal(_, _), do: {:error, "all digits must be >= 0 and < input base"}

  defp from_decimal(0, _), do: [0]
  defp from_decimal(number, base) do
    do_from_decimal(number, base, [])
  end

  defp do_from_decimal(0, _, acc), do: acc
  defp do_from_decimal(number, base, acc) do
    do_from_decimal(div(number, base), base, [rem(number, base) | acc])
  end
end
