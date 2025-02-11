defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """

  # Dla ciągu znaków (string)
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name) when is_binary(name), do: "One for #{name}, one for me."

  # Dla wersji bez argumentów
  @spec two_fer() :: String.t()
  def two_fer(), do: "One for you, one for me."

  # Dla przypadków, gdy argument nie jest ciągiem znaków
  def two_fer(_), do: raise FunctionClauseError
end
