defmodule BasketballWebsite do
  def extract_from_path(data, path), do: getVal(data, String.split(path,"."))


  defp getVal(data, [key]), do: data[key]
  defp getVal(data, [key | tail]), do: getVal(data[key],tail)

  def get_in_path(data, path), do: get_in(data, String.split(path,"."))
end
