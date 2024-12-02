defmodule Sorting.Application do
  use Application

  def start(_type, _args) do
    IO.puts("Witaj w aplikacji Sorting!")  # Wypisanie komunikatu na ekran
    unsorted_list = [34,1,5,54,21,2]
    IO.inspect(unsorted_list)  # Wypisanie listy
    sorted = Bubble1.sort(unsorted_list)
    IO.inspect(sorted)
    {:ok, self()}  # Zwrócenie procesu aplikacji
  end
end
