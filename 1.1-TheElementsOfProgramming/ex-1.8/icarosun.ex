square = fn x -> x * x end

improve = fn x, y ->
  (x / square.(y) + 2 * y) / 3
end

cube = fn x -> x * x * x end

good_enough? = fn guess, x ->
  abs(cube.(guess) - x) < 0.001
end

cbrt_iter = fn function, guess, x ->
  if good_enough?.(guess, x) do
    guess
  else
    function.(function, improve.(x, guess), x)
  end
end

cbrt = fn x -> cbrt_iter.(cbrt_iter, 1, x) end

IO.puts(cbrt.(1000))
