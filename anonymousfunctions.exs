#Functions-1
list_concat = fn
  [a, b], [c, d] -> [a, b, c, d]
end

list_concat.([:a, :b], [:c, :d])

sum = fn
  a, b, c -> a + b + c
end

sum.(1, 2, 3)

pair_to_tuple_list = fn
  {a, b} -> [a, b]
end

pair_to_tuple_list.({1234, 5678})

handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("README.md"))
IO.puts handle_open.(File.open("anything"))

#Functions-2
fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

IO.puts fizz_buzz.(0, 0, 15)
IO.puts fizz_buzz.(0, 3, 3)
IO.puts fizz_buzz.(2, 0, 5)
IO.puts fizz_buzz.(1, 1, 1)

#Functions-3
fizzify = fn
  number -> fizz_buzz.(rem(number, 3), rem(number, 5), number)
end

Enum.each 10..16, fn number ->
  IO.puts fizzify.(number)
end