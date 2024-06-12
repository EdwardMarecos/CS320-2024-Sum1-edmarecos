(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)

(*
HX-2024-06-11: 10 points
Fibonacci numbers can be recursively
defined as follows:
fun fibonacci(x: int): int =
  if x >= 2
  then fibonacci(x-2)+fibonacci(x-1) else x
Please use int1_foldright to implement the
function fibonacci WITHOUT using recursion.
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is DISQUALIFIED.
//
fun fibonacci_nrec(x: int): int = ...
//
*)

(* ****** ****** *)

fun fibonacci_nrec( x : int) : int =
    case x < 2 of 
        true => x
      | _    => 
            let
                val (result, _) =
                int1_foldright( x, (1, 0), fn(x0, (a, b)) => (* use a tuple rather than 1 num *)
                    if x0 < 2 then (a + b, b)   
                    else (b, a + b) (* accumilate val, same logic as q1 *)
                )
            in result end   (* tie val to a result *)

(* some tests i ran below
val zero = fibonacci_trec(0)
val one = fibonacci_trec(1)
val one1 = fibonacci_trec(2)
val two = fibonacci_trec(3)
val three = fibonacci_trec(4)
val five = fibonacci_trec(5)
val eight = fibonacci_trec(6)
val thirteen = fibonacci_trec(7)
val twentyone = fibonacci_trec(8)
val thirtyfour = fibonacci_trec(9)
val fiftyfive = fibonacci_trec(10) *)

(* end of [CS320-2024-Sum1-midterm1-02.sml] *)
