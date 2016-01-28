#ListsAndRecursion-0
defmodule Math do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)
end

defmodule ListOperations do
  #ListsAndRecursion-1
  def mapsum([], _), do: 0
  def mapsum([head|tail], function), do: function.(head) + mapsum(tail, function)
  
  #ListsAndRecursion-2
  def max([]), do: nil
  def max([head|tail]) do
    case max(tail) do
      value when value > head and value !== nil -> value
      _ -> head
    end
  end
end