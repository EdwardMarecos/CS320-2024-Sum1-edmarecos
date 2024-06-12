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
ELEMENTS IN THE SUBLIST DO HAVE TO BE CONSECUTIVE.
                        ^^

You can use unrestricted recursion to solve this problem.
*)
(* ****** ****** *)

fun sublist_sum_test1 ( xs : int list, sum : int) : bool =
    let 
        fun loop (xs : int list, sum) =
            let 
                fun inner_loop (xs, sum, tot) =
                    case xs of
                        []          => false
                      | x1 :: xs    =>
                            case (x1 + tot = sum) of
                                true    =>  true
                              | _       =>  inner_loop (xs, sum, x1 + tot)
            in 
                case xs of 
                    []       => false
                  | x1 :: xs => 
                        case (inner_loop (xs, sum, x1)) of
                            true    => true
                          |  _      => loop (xs, sum)
            end
    in 
        loop (xs, sum)
    end

(* corrections made
    i divided the inner loop in two to more easily keep track of the 
    head, while being able to freely traverse the remainder of the 
    list. (pretty much write same segment twice) with cleanup.
    removed tot > / < sum because it was redundant, just means <>
*)


(* some tests i ran
val t1xs = [1,2,3,4,5]
val t1 = sublist_sum_test1(t1xs, 5)

val t2xs = [~5, 2, 3, ~4, 0]
val t2 = sublist_sum_test1(t2xs, ~1)
val f1 = sublist_sum_test1(t2xs, ~2) *)

(* val t2xs = [1,1,4,~3]
val t2 = sublist_sum_test1(t2xs, 3) *)

(* end of [CS320-2024-Sum1-midterm1-05.sml] *)
