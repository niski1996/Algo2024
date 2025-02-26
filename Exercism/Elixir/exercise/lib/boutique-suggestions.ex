defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options\\[]) do
    for %{item_name: tname, base_color: tcol, color: tcol, price: tpr}<- tops,
     %{item_name: bname,  base_color: bcol, color: bcol, price: bpr} <- bottoms,
     tcol != bcol do
      {%{item_name: tname,  base_color: tcol, color: tcol, price: tpr},
      %{item_name: bname,  base_color: bcol, color: bcol, price: bpr}}
    end
  end
end
