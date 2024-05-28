
# fun fact2(n: int): int =
# let
#     fun
#     loop(n: int, res: int): int =
#     if n > 0
#     then loop(n-1, n * res) else res
# in
#     loop(n, 1)
# end

def fact2(n: int) -> int:
  def loop(n, res):
    if (n > 0):
      return loop(n-1, n * res)
    else: return res
  return loop(n, 1)

N = 10
print("fact2(", N, ") = ", fact2(N))

# end of [lectures/lec-05-22-fact.pyt]
