defmodule FizzBuzz do  
  def apply_rules(number, rules) do
    apply_rule_for_number = fn n -> fn (r, a) -> apply_rule(r, a, n) end end
  
    rules
    |> List.foldr("", apply_rule_for_number.(number))
    |> generate_output(number)
    |> IO.puts
  end
  
  defp apply_rule({factor, custom_substitution}, accumulator, number) do
    accumulator <> substitute(rem(number, factor), custom_substitution)
  end
  
  defp substitute(0, substitution), do: substitution
  defp substitute(_, _), do: ""
  
  defp generate_output("", number), do: number
  defp generate_output(substitute, _), do: substitute
end

rules = [{3, "Fizz"}, {5, "Buzz"}, {7, "Pop"}]

1..100
|> Enum.each(&(FizzBuzz.apply_rules &1, rules))