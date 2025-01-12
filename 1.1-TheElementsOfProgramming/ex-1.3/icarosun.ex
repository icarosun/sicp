square = fn x -> x * x end

sum_square = fn x, y -> square.(x) + square.(y) end

procedure = fn x, y, z ->
  cond do
    x > y and z > y -> sum_square.(x, z)
    true -> sum_square.(y, max(x, z))
  end
end

# IO.puts(procedure.(3, 1, 5))
