defmodule Bubble1 do
  def sort(list) do
    {input_list, sorted} = pair_compare(list, false)
    if sorted do
      input_list
    else
      sort(input_list)
    end
  end

  def pair_compare([head1, head2 | tail], sorted) do
    if head1 > head2 do
      {rest, _} = pair_compare([head1 | tail], false)
      {[head2 | rest], false}
    else
      {rest, sort_status} = pair_compare([head2 | tail], sorted)
      {[head1 | rest], sort_status}
    end
  end

  def pair_compare([single_element], _) do
    {[single_element], true}
  end

  def pair_compare([], _), do: {[], true}
end
