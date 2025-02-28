defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-" <> Integer.to_string(Enum.random(1000..9999))
  end

  def random_stardate() do
    Enum.random(41000, 41999)+:rand.uniform()
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> List.to_string()
  end
end
