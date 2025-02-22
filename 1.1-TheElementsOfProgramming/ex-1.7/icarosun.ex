average = fn x, y ->
  (x + y) / 2
end

improve = fn guess, x ->
  average.(guess, x / guess)
end

good_enough? = fn oldguess, guess ->
  abs(oldguess - guess) < 0.001
end

sqrt_iter = fn function, oldguess, guess, x ->
  if good_enough?.(oldguess, guess) do
    guess
  else
    IO.puts(guess)
    function.(function, guess, improve.(guess, x), x)
  end
end

sqrt = fn x -> sqrt_iter.(sqrt_iter, 1, 2, x) end

IO.puts("Call function to 4")
IO.puts(sqrt.(4))
IO.puts("Call function to 8")
IO.puts(sqrt.(8))
IO.puts("Call function to 36")
IO.puts(sqrt.(36))
IO.puts("Call function to 100")
IO.puts(sqrt.(100))
IO.puts("Call function to 112")
IO.puts(sqrt.(112))
