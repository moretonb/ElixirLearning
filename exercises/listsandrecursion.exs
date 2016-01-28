#ListsAndRecursion-0
defmodule Math do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)
end

defmodule ListOperations do
  #ListsAndRecursion-1
  def mapsum([], _), do: 0
  def mapsum([head|tail], function), do: function.(head) + mapsum(tail, function)
end