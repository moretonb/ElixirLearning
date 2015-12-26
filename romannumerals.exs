defmodule RomanNumerals do
    @mapping [{1000, "M"},{900, "CM"},{500, "D"},{400, "CD"},{100, "C"},{90, "XC"},{50, "L"},{40, "XL"},{10, "X"},{9, "IX"},{5, "V"},{4, "IV"},{1, "I"}]

    def parse_int(value), do: parse_int value, ""
    
    def parse_int(value, accumulator) when value > 0 do        
        parse_int @mapping, accumulator, value
    end
    
    def parse_int(_, accumulator), do: accumulator
    
    def parse_int([{k,v}|_], accumulator, value) when k <= value do
        parse_int value - k, accumulator <> v
    end
    
    def parse_int([_|tail], accumulator, value) do
        parse_int tail, accumulator, value
    end
    
    def to_int(value), do: to_int(String.graphemes(value), 0)
    
    def to_int([], accumulator), do: accumulator
    
    def to_int([head|tail], accumulator) do
        to_int tail, head, accumulator
    end
    
    def to_int([head|tail], previous, accumulator) when previous == "" do
        to_int tail, head, accumulator
    end
    
    def to_int([head|tail], previous, accumulator) do
        value = get_value_for_numeral previous <> head
        if(value == 0) do
            to_int tail, head, accumulator + get_value_for_numeral(previous)
        else
            to_int tail, "", accumulator + value
        end        
    end
    
    def to_int([], previous, accumulator) do
        accumulator + get_value_for_numeral(previous)
    end
    
    def get_value_for_numeral(numeral) do
        case List.keyfind(@mapping, numeral, 1) do
            {k, _} -> k
            _ -> 0
        end
    end
end

IO.puts RomanNumerals.parse_int(1914)
IO.puts RomanNumerals.to_int("MCMXIV")