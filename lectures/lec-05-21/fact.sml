(* ****** ****** *)
(*
HX-2024-05-21:
A basic recursive implementation
of the factorial function.
*)
(* ****** ****** *)

fun fact_rec(n: int): int =
  if n > 0 then n * fact_rec(n-1) else 1

(* ****** ****** *)

fun fact_trec(n: int): int =
  loop(n, 1)
and loop(n: int, res: int): int =
  if n > 0 then loop(n-1, n * res) else res

(* ****** ****** *)
val fact10_rec = fact_rec(10)
val fact10_trec = fact_trec(10)
(* ****** ****** *)

(* end of [lectures/lec-05-21-fact.sml] *)
