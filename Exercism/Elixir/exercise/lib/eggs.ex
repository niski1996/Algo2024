defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    number
    |> Integer.digits(2)
    |> Enum.reduce(0,&add/2)
  end

  defp add(num, acc), do: acc+num
end
