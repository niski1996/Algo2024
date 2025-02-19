defmodule WineCellar do
  def explain_colors do [white: "Fermented without skin contact.",
  red: "Fermented with skin contact using dark-colored grapes.",
  rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
 ]

  end

  def filter(cellar, color, opts \\ []) do
    year_val = Keyword.get(opts, :year, nil)
    country_val = Keyword.get(opts, :country, nil)

    cellar
    |> Enum.filter(&match?({^color, _}, &1))
    |> Enum.map(&elem(&1,1))
    |> Enum.filter(fn {_,year, country} ->
      (year_val == nil || year == year_val) and
      (country_val==nil || country == country_val)

    end)


  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
