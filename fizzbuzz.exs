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
    match = match_3(number) <> match_5(number) <> match_7(number)
    case match do
      "" -> number
      _ -> match
    end
  end
  
  def match_3(number) when rem(number, 3) == 0 do
    "Fizz"
  end
  
  def match_3(_) do
    ""
  end
  
  def match_5(number) when rem(number, 5) == 0 do
    "Buzz"
  end
  
  def match_5(_) do
    ""
  end
  
  def match_7(number) when rem(number, 7) == 0 do
    "Pop"
  end
  
  def match_7(_) do
    ""
  end
  
  def custom(number, factor, substitution) do
    case rem(number, factor) do
      0 -> substitution
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

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.custom number, 2, "Fizz"
end