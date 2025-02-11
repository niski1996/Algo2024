defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    commands = []
    |> add_command(code, 0b00001, "wink")
    |> add_command(code, 0b00010, "double blink")
    |> add_command(code, 0b00100, "close your eyes")
    |> add_command(code, 0b01000, "jump")

    if Bitwise.band(0b10000, code)==0b10000 do
      Enum.reverse(commands)
    else
      commands
    end

  end
  defp add_command(commands, code, mask, action) do
    if Bitwise.band(mask, code) == mask do
      [action | commands]
    else
      commands
    end
  end
end
