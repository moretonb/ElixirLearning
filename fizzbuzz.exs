defmodule FizzBuzz do
  def output(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0,0} -> "FizzBuzz"
      {0,_} -> "Fizz"
      {_,0} -> "Buzz"
      _ -> number
    end
  end
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.output number
end