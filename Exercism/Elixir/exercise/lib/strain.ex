defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([head | tail], fun) do
    if fun.(head) do
      [head | keep(tail, fun)]
    else
      keep(tail, fun)
    end
  end
  def keep([], fun), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([head | tail], fun) do
    if !fun.(head) do
      [head | keep(tail, fun)]
    else
      discard(tail, fun)
    end
  end
  def discard([], fun), do: []
end
