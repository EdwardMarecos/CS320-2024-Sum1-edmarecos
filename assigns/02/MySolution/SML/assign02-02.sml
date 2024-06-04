(* ****** ****** *)
use "./../../assign02-lib.sml";
(* ****** ****** *)
(*
Please manually copy your implementation
of xlist_size if you need it:
use "./../../MySolution/SML/assign02-01.sml";
*)
(* ****** ****** *)

(*
//
Assign02-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)

fun xlist_sub ( xs : 'a xlist , i0 : int ) : 'a = 
    let
        fun loop ( xs : 'a xlist , i0 : int) : 'a =
        case (xs, i0 = 0) of
            (xlist_nil, _)                  => raise XlistSubscript
          | (xlist_cons(x1,_), true)        => x1
          | (xlist_cons(_,rest), false)     => loop (rest, i0 - 1)
          | (xlist_snoc(_,x1), true)        => x1
          | (xlist_snoc(rest,_), false)     => loop (rest, i0 - 1)
          | (xlist_append(xs1, xs2), true)  => loop( xs1, loop( xs2, size))
          | (xlist_append(xs1, xs2), false) => loop( xs1, loop( xs2, size))
          
    in
        case ( i0 < 0 ) of
            true            => raise XlistSubscript
          | _               => loop (xs, i0, 0)
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-02.sml] *)
