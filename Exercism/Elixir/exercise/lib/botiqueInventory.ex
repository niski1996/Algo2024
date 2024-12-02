defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :desc)
  end


  def with_missing_price(inventory) do
    Enum.filter(inventory, fn i-> i.price==nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn i->String.replace(i.name, old_word, new_word) end)
  end

  def increase_quantity(item, count) do
    updated_quantities =
      item.quantity_by_size
      |> Enum.map(fn {size, quantity} -> {size, quantity + count} end)
      |> Enum.into(%{})

    %{item | quantity_by_size: updated_quantities}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size,0, fn x,acc ->x+acc end)
  end
end
