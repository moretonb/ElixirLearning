defmodule RomanNumerals do
    def parse_int(value) do
        parse_int(value, "")
    end
    def parse_int(value, accumulator) do
        if value > 0 do
            mapping = [{1000, "M"},{900, "CM"},{500, "D"},{400, "CD"},{100, "C"},{90, "XC"},{50, "L"},{40, "XL"},{10, "X"},{9, "IX"},{5, "V"},{4, "IV"},{1, "I"}]
            parse_int(mapping, accumulator, value)
        else
            accumulator
        end
    end
    def parse_int([head|tail], accumulator, value) do
        case head do
            {k,v} when k <= value -> parse_int(value - k, accumulator <> v)
            _ -> parse_int(tail, accumulator, value)    
        end
    end
end

IO.puts RomanNumerals.parse_int(1914)