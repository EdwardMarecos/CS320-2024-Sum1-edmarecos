(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
//
// HX-2024-06-11: 10 points
//
Recall the iforall combinator:

type
('seq, 'elt) iforall =
'seq * (int * 'elt -> bool) -> bool

For instance, list_iforall can be implemented
as follows:

fun
list_iforall(xs, itest) =
let
  fun loop(i0, xs) =
    case xs of
      [] => true
    | x1 :: xs =>
      if itest(i0, x1) then loop(i0+1, xs) else false
in
  loop(0, xs)
end
//
*)
(* ****** ****** *)

(*
Given a sequence xs and an integer, lengte(xs, n)
returns true if and only if the length of xs >= n
Please give an implementation of lengte based on iforall:
(*										     
fun iforall_to_lengte(iforall) = fn(xs, n) => ...
*)
*)

(* ****** ****** *)

fun iforall(xs, itest) =
    let
        fun loop(i0, xs) =
            case xs of
                [] => true
              | x1::xs => if itest(i0, x1) then loop(i0+1, xs) else false
    in
        loop(0, xs)
    end

(* had to declare this because it wasnt in the library
fun iforall_to_lengthe( iforall ) = 
    fn ( xs, n ) =>
        not (iforall( xs, fn ( ind, x1 ) =>
            ( ind + 1 ) < n
        )) *)

(* some tests i ran
val xs = [1,2,3,4,5,6,7,8]
val n1 = ~1
val n2 = 8
val n3 = 7
val n4 = 0

val b1 = 9
val b2 = 12
val b3 = 100

val true1 = iforall_to_lengthe(iforall) (xs, n1)
val true2 = iforall_to_lengthe(iforall) (xs, n2)
val true3 = iforall_to_lengthe(iforall) (xs, n3)
val true4 = iforall_to_lengthe(iforall) (xs, n4)

val false1 = iforall_to_lengthe(iforall) (xs, b1)
val false2 = iforall_to_lengthe(iforall) (xs, b2)
val false3 = iforall_to_lengthe(iforall) (xs, b3) *)

(* end of [CS320-2024-Sum1-midterm1-04.sml] *)
