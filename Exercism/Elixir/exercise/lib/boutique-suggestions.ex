defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    price = Keyword.get(options, :maximum_price, 100)


    for %{item_name: tname, base_color: tcol, color: tcolor, price: tpr} <- tops,
        %{item_name: bname, base_color: bcol, color: bcolor, price: bpr} <- bottoms,
        tcol != bcol && tpr+bpr<price do
      {%{item_name: tname, base_color: tcol, color: tcolor, price: tpr},
       %{item_name: bname, base_color: bcol, color: bcolor, price: bpr}}
    end
  end
end
