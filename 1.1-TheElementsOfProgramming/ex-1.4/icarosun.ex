# It not run in elixir

# (define (a-plus-abs-b a b)
#  ((if (> b 0) + -) a b))

a_plus_abs_b = fn
  a, b when b > 0 -> a + b
  a, b -> a - b
end

# IO.puts(a_plus_abs_b.(10, 1))
#
# The application will check if b is positive or negative. If b is negative, it will perform the
# subtraction operation; otherwise, it will perform the addition operation. Therefore, b will always
# be treated as an absolute value
