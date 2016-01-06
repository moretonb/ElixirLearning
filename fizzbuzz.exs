defmodule FizzBuzz do
  def output(number) when rem(number, 3) == 0 and rem(number, 5) == 0 do
    "FizzBuzz"
  end

  def output(number) when rem(number, 3) == 0 do
    "Fizz"
  end
  
  def output(number) when rem(number, 5) == 0 do
    "Buzz"
  end
  
  def output(number) do
    number
  end
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.output number
end