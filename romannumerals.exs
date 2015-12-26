defmodule RomanNumerals do
    def parse_int(value) do
        parse_int(value, "")
    end
    
    def parse_int(value, accumulator) do
        mapping = [{1, "I"},{4, "IV"},{5, "V"},{9, "IX"},{10, "X"},{40, "XL"},{50, "L"},{90, "XC"},{100, "C"},{400, "CD"},{500, "D"},{900, "CM"},{1000, "M"}]
        
        evaluateNumeral = fn
            {k,v}, accumulator when k <= value -> parse_int(value - k, accumulator <> v)
            _ -> accumulator
        end
        
        if value > 0 do
            List.foldl(mapping, accumulator, evaluateNumeral)
        else
            accumulator
        end
    end
end

IO.puts RomanNumerals.parse_int(1914)