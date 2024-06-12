(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
Given a list of integers xs and an integer,
please implement a function that checks if
there exists a sublist of xs whose sum equals
the given integer:

fun
sublist_sum_test(xs: int list, sum: int): bool

NOTE THAT INTEGERS CAN BE NEGATIVE. ALSO THE
ELEMENTS IN THE SUBLIST DO NOT HAVE TO BE CONSECUTIVE.
                        ^^^^^^

You can use unrestricted recursion to solve this problem.
*)
(* ****** ****** *)

fun sublist_sum_test2 ( xs : int list, sum : int) : bool =
    case xs of
        [] => (sum = 0)
      | x :: xs =>
            sublist_sum_test2(xs, sum - x) orelse sublist_sum_test2(xs, sum)


(* corrections made
    the main correction, and frankly a major one, instead of using 
    foldleft, i just made a recursive call that would remove one 
    element from a list, this ends up testing all sublists of
    xs, and checks if any had a value equal to sum.
    my initial idea in class was to sort and then run the question 
    five code on it. i also finished it as it was incomplete
    these are not similar, so i understand if its not accepted :)
*)

(* tests i ran
val test1 = sublist_sum_test2([1, 2, 3, 4, 5], 10)
val test2 = sublist_sum_test2([1, 2, 3, 4, 5], 15)
val test3 = sublist_sum_test2([1, 2, 3, 4, 5], 5)
val test4 = sublist_sum_test2([1, 2, 3, 4, 5], 7)
val test5 = sublist_sum_test2([1, 2, 3, 4, 5], ~1)
val test6 = sublist_sum_test2([1, ~1, 2, 3, ~2, 4], 4)
val test7 = sublist_sum_test2([1, ~1, 2, 3, ~2, 4], 3)
val test8 = sublist_sum_test2([~1, ~2, ~3, ~4, ~5], ~10) *)

(* end of [CS320-2024-Sum1-midterm1-06.sml] *)
