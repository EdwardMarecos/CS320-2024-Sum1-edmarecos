(* ****** ****** *)
use "./../../assign05-lib.sml";
(* ****** ****** *)

(*
//
HX-2024-06-14: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

val theNatPairs_cubesum: (int * int) stream = 
  let
    fun acc (i : int, j : int) : (int * int) =
      if i = j then (0, j + 1) else (i + 1, j)

    fun aux (i, j) = 
      fn () => strcon_cons ((i, j), aux (acc (i, j)))

    fun cube_sum ((i, j): int * int): int =
      i * i * i + j * j * j

    fun merge (s1: (int * int) strcon, s2: (int * int) strcon): (int * int) strcon =
      fn () =>
        let
          val strcon_cons (x1, xs1) = s1 ()
          val strcon_cons (x2, xs2) = s2 ()
          val sum1 = cube_sum x1
          val sum2 = cube_sum x2
        in
          if sum1 < sum2 then strcon_cons (x1, merge (xs1, s2))
          else strcon_cons (x2, merge (s1, xs2))
        end

    fun merge_all (n: int): (int * int) stream =
      fn () => merge (aux (0, n) (), merge_all (n + 1) ())

  in
    merge_all 0
  end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign05-02.sml] *)
