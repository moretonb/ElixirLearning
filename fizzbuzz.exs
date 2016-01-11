defmodule FizzBuzz do  
  def substitute(number, {factor, substitution}) do
    case rem(number, factor) do
      0 -> substitution
      _ -> ""
    end
  end
  
  def custom(number, [head|tail], accumulator) do
    custom(number, tail, accumulator <> substitute(number, head))
  end
  
  def custom(number, [], accumulator) when accumulator == "" do
    number
  end
  
  def custom(number, [], accumulator) do
    accumulator
  end
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.custom number, [{3, "Fizz"}, {5, "Buzz"}, {7, "Pop"}], ""
end