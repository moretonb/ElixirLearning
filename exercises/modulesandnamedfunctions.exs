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
  def guess(number, range), do: make_guess({nil, range}, number)
  
  defp make_guess({guess, _}, number) when guess == number do
    IO.puts guess
  end
  
  defp make_guess({_, range}, number) do
    range
    |> calculate_midpoint
    |> calculate_new_range(range, number)
    |> print_guess_to_console
    |> make_guess(number)
  end
  
  defp calculate_midpoint(lower..upper), do: div(upper - lower, 2) + lower
  
  defp calculate_new_range(midpoint, lower.._, number) when midpoint > number do
     {midpoint, lower..(midpoint - 1)}
  end
  
  defp calculate_new_range(midpoint, _..upper, _), do: {midpoint, (midpoint + 1)..upper}
  
  defp print_guess_to_console({guess, range}) do
    IO.puts "Is it #{guess}"
    {guess, range}
  end
end

#ModulesAndFunctions-7
defmodule Libraries do
  def to_money_string(value), do: :io.fwrite("~.2f~n", value)  
  def get_environment_variable(name), do: IO.puts System.get_env(name)
  def get_extension(path), do: IO.puts Path.extname(path)
  def get_current_directory(), do: IO.puts System.cwd()
  #https://github.com/devinus/poison
  def execute_shell_command(command), do: :os.cmd(command)
end