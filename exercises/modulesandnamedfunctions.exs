#ModulesAndFunctions-1,2,3
defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end

#ModulesAndFunctions-4,5
defmodule Mathematics do
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)
  
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

#ModulesAndFunctions-6
defmodule Chop do
  def guess(number, range), do: output(number, range, false)

  defp output(number, _, true), do: IO.puts number
  
  defp output(number, range, _) do
    {our_guess, new_range, success} = make_guess_with_range(range, number)
    
    IO.puts "Is it #{our_guess}"
    output(number, new_range, success)
  end
  
  defp make_guess_with_range(lower..upper, number) do
    midpoint = div(upper - lower, 2) + lower
    
    {midpoint, calculate_new_range(lower, upper, midpoint, number), midpoint == number}
  end
  
  defp calculate_new_range(lower, _, midpoint, number) when midpoint > number do
     lower..(midpoint - 1)
  end
  
  defp calculate_new_range(_, upper, midpoint, _), do: (midpoint + 1)..upper
end