defmodule FizzBuzz do
  def fizzify(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0,0} -> "FizzBuzz"
      {0,_} -> "Fizz"
      {_,0} -> "Buzz"
      _ -> number
    end
  end
  
  def popify(number) do
    case {rem(number, 3), rem(number, 5), rem(number, 7)} do
      {0,0,0} -> "FizzBuzzPop"
      {0,0,_} -> "FizzBuzz"
      {0,_,0} -> "FizzPop"
      {_,0,0} -> "BuzzPop"
      {0,_,_} -> "Fizz"
      {_,0,_} -> "Buzz"
      {_,_,0} -> "Pop"
      _ -> number
    end
  end
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.fizzify number
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.popify number
end