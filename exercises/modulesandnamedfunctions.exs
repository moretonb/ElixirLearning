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
