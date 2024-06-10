(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

fun list_tabulate ( n : int, f : int -> 'a ) : 'a list =
    list_reverse (int1_foldleft(n, [], fn (acc, n0) => 
        f(n0) :: acc
    ))

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-03.sml] *)
