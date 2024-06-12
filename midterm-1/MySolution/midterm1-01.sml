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
Please give a direct non-combinator-based
tail-recursive implementation of fibonacci:
//
fun fibonacci_trec(x: int): int = ...
//
PLEASE NOTE THAT YOU CANNOT MAKE NON-TAIL-
RECURSIVE CALLS in your implementation. If you
do, your implementation is DISQUALIFIED.
//
*)

(* ****** ****** *)

fun fibonacci_trec( x : int ) : int =
    let 
        fun loop (x : int, left : int, right : int, num : int) : int =
            case num = x of
                true  => left + right
              | _     => loop(x, right, left + right, num + 1)
    in
        case x >= 2 of      (* had comparison operator backwards *)
            true    => loop(x, 0, 1, 2)
          | _       => x
    end

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

(* end of [CS320-2024-Sum1-midterm1-01.sml] *)
