(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)



fun fact(x : int) : int =
    (*if x > 0 then x * fact(x-1) else 1*)
    let
        fun aux(x : int, acc : int): int =
            if x > 0 then aux(x - 1, x * acc) else acc
    in
        aux(x, 1)
    end

(*
val
rec
fact = fn(x: int) =>
if x > 0 then x * fact(x-1) else 1
*)

fun loop(i : int) : int =
    let 
        val _ = fact(i) 
    in 
        loop(i + 1) 
    end 
    handle Overflow => i

val myans = loop(0);

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-01.sml] *)
