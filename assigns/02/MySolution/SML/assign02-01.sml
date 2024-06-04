(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)

fun xlist_size ( xs : 'a xlist) : int =
    let 
        fun loop ( xs : 'a xlist , size : int ) : int = 
            case xs of
                xlist_nil               => size
              | xlist_cons(_, rest)     => loop( xs, size + 1)
              | xlist_snoc(rest, _)     => loop( rest, size + 1)
              | xlist_append(xs1, xs2)  => loop( xs1, loop( xs2, size))
              | xlist_reverse(rest)     => loop( rest, size)
                (* cons cell has element and sublist*)
                (* representative of an empty list *)
    in
        loop( xs , 0)       
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-01.sml] *)
