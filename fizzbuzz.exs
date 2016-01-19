defmodule FizzBuzz do  
  def substitute(0, substitution), do: substitution
  def substitute(_, _), do: ""

  def custom(number, [{factor, custom_substitution}|tail], accumulator) do
    custom(number, tail, accumulator <> substitute(rem(number, factor), custom_substitution))
  end
    
  def custom(number, [], ""), do: number  
  def custom(_, [], accumulator), do: accumulator
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.custom number, [{3, "Fizz"}, {5, "Buzz"}, {7, "Pop"}], ""
end