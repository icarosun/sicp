average = fn x, y ->
  (x + y) / 2
end

improve = fn guess, x ->
  average.(guess, x / guess)
end

square = fn x -> x * x end

good_enough = fn guess, x ->
  abs(square.(guess) - x) < 0.001
end

sqrt_iter = fn function, guess, x ->
  if good_enough.(guess, x) do
    guess
  else
    function.(function, improve.(guess, x), x)
  end
end

square = fn x -> sqrt_iter.(sqrt_iter, 1, x) end

IO.puts(square.(4))

new_if = fn predicate, then_clause, else_clause ->
  cond do
    predicate -> then_clause
    true -> else_clause
  end
end

sqrt_iter_alyssa = fn function, guess, x ->
  new_if.(good_enough.(guess, x), guess, function.(function, improve.(guess, x), x))
end

square_alyssa = fn x -> sqrt_iter_alyssa.(sqrt_iter_alyssa, 1, x) end

IO.puts(new_if.(2 == 3, 0, 5))
IO.puts(new_if.(1 == 1, 0, 5))

# In the applicative-order evluation the code will enter in a loop. 
# If use 'if' the code will run normally. 
# IO.puts(square_alyssa.(4))
