defmodule FizzBuzz do  
  def substitute(0, substitution), do: substitution
  def substitute(_, _), do: ""
  
  def custom(number, [{factor, substitution}|tail], accumulator) do
    sub = substitute(rem(number, factor), substitution)
    new_accumulator = accumulator <> sub
    
    custom(number, tail, new_accumulator)
  end
    
  def custom(number, [], ""), do: number  
  def custom(_, [], accumulator), do: accumulator
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.custom number, [{3, "Fizz"}, {5, "Buzz"}, {7, "Pop"}], ""
end