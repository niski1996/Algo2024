defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    [tens | [unit | [magn | _]]]=colors
    cond do
      unit == :black ->
        {(toNumber(tens))*(:math.pow(10,rem(toNumber(magn),3)+1)),magnitude(toNumber(magn)+1)}
            IO.inspect("dupa")
      :true ->
        {(toNumber(tens)*10+toNumber(unit))*(:math.pow(10,rem(toNumber(magn),3))),magnitude(toNumber(magn))}
    end

  end

  def toNumber(:black), do: 0
  def toNumber(:brown), do: 1
  def toNumber(:red), do: 2
  def toNumber(:orange), do: 3
  def toNumber(:yellow), do: 4
  def toNumber(:green), do: 5
  def toNumber(:blue), do: 6
  def toNumber(:violet), do: 7
  def toNumber(:grey), do: 8
  def toNumber(:white), do: 9

  def magnitude(num) do
    cond do
      num < 3 -> :ohms
      num < 6 -> :kiloohms
      num < 9 -> :megaohms
      true -> :gigaohms
    end
  end
end
