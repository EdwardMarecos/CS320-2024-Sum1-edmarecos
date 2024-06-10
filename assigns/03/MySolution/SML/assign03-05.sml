(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
HX-2023-06-05: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun isPrime (n0: int): bool =
  let
    fun loop(i0: int): bool =
      if (i0 * i0 > n0) then true 
      else (
        if n0 mod i0 = 0 then false
        else loop(i0+1))
  in
    if n0 >= 2 then loop(2) 
    else false
  end
*)

fun isPrime( n0 : int) : bool =
  if n0 >= 2 then 
    if n0 = 2 then true else 
      int1_forall(n0, fn(i0) =>
        if i0 < 2 then true 
        else n0 mod i0 <> 0
      )
  else false
  

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-05.sml] *)
