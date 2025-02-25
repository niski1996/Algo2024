defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      String.match?(input, ~r/^[^a-z]*[A-Z][^a-z]*$/) && String.ends_with?(input, "?") -> "Calm down, I know what I'm doing!"
      String.ends_with?(String.trim_trailing(input), "?") -> "Sure."
      String.match?(input, ~r/^[^a-z]*[A-Z][^a-z]*$/)-> "Whoa, chill out!"
      true -> "Whatever."

    end
  end
end
