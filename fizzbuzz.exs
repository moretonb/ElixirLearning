defmodule FizzBuzz do  
  def substitute(0, substitution), do: substitution
  def substitute(_, _), do: ""
  
  def calculate_remainder(number), do: &(rem(number, &1))

  def custom(number, custom_substitutions) do
    apply_remainder = calculate_remainder(number)
    
    custom(number, custom_substitutions, "", apply_remainder)
  end
  
  def custom(number, [{factor, custom_substitution}|tail], accumulator, apply_remainder) do
    remainder = apply_remainder.(factor)
    substitution = substitute(remainder, custom_substitution)
    new_accumulator = accumulator <> substitution
    
    custom(number, tail, new_accumulator, apply_remainder)
  end
    
  def custom(number, [], "", _), do: number  
  def custom(_, [], accumulator, _), do: accumulator
end

Enum.each 1..100, fn number ->
  IO.puts FizzBuzz.custom number, [{3, "Fizz"}, {5, "Buzz"}, {7, "Pop"}]
end