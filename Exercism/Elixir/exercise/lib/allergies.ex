defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    flags
    |> Integer.digits(2)
    |> Enum.with_index()
    |> Enum.reduce([], &append/2)

  end

  defp append({0,_}, acc), do: acc
  defp append({_,0}, acc), do: ["eggs" | acc]
  defp append({_,1}, acc), do: ["peanuts" | acc]
  defp append({_,2}, acc), do: ["shellfish" | acc]
  defp append({_,3}, acc), do: ["strawberries" | acc]
  defp append({_,4}, acc), do: ["tomatoes" | acc]
  defp append({_,5}, acc), do: ["chocolate" | acc]
  defp append({_,6}, acc), do: ["pollen" | acc]
  defp append({_,7}, acc), do: ["cats " | acc]
  defp append({_,_}, acc), do:  acc

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    alergens = list(flags)
    Enum.member?(alergens,item)
  end
end
