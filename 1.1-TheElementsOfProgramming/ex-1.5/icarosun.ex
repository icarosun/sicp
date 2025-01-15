# it no run in elixir

# (define (p) (p))
# (define (test x y)
#  (if (= x 0) 0 y))

defmodule Exercise do
  def p() do
    p()
  end

  def test(x, y) do
    if x == 0 do
      0
    else
      y
    end
  end
end

IO.puts(Exercise.test(0, Exercise.p()))

# The code will enter a loop
#
# In applicative-order evaluation the code will enter a loop.
# Applicative-order evaluation checks the argument first, then the the function
#
# (test 0 (p))
# (test 0 (p)p)p)...)
#
# In normal-order evaluation, the code will run and finish by printing a zero.
# Normal-order evaluation first check the function before the arguments the arguments
#
# (test 0 (p))
# (if (= x 0) 0 (p))
# (if (true) 0 (p))
# 0
#
