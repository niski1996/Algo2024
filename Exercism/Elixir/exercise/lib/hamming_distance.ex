defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    if length(strand1) == length(strand2) do
      {:ok, count_hamming(strand1,strand2)}
    else
      {:error, "strands must be of equal length"}
    end
  end

  def count_hamming([h1 | t1], [h2 | t2]) do
    if h1 != h2 do
      1+count_hamming(t1,t2)
    else
      count_hamming(t1,t2)
    end
  end

  def count_hamming([],[]), do: 0

  end
