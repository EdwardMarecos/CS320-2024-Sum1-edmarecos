(* ****** ****** *)
datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)
type 'a stream = (unit -> 'a strcon)
(* ****** ****** *)

(*
HX: 10 points for this one:

Given a non-empty list [x1, x2, ..., xn],
please construct an infinite stream consisting
elements in the following order:

x1, x2, ..., xn, xn, ..., x2, x1,
x1, x2, ..., xn, xn, ..., x2, x1, ...

For instance, if the given list is [1, 2, 3], then
the stream represents: 1,2,3,3,2,1,1,2,3,3,2,1,...

fun midterm2_04(xs: 'a list): 'a stream = ...
*)

(* ****** ****** *)

fun midterm2_04(xs: 'a list): 'a stream =
  let 
    fun cons(xs, still) =
      case xs of
      []        => cons(list_reverse(still), list_reverse(still))
    | x1 :: xs  => stream_cons(x1, fn () => cons(xs, still))
  in
    cons(xs, xs)
  end

(* most corrections made here were syntactical,
   but i did add an extra reverse to avoid it doing
   it non-reverse twice in a row upon start
*)

(* end of [CS320-2024-Sum1-midterm2-04.sml] *)
