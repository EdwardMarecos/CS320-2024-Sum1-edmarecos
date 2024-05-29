(* ****** ****** *)

(*
Implement sort5 that sorts a given tuple of length 5.
Your implementation CANNOT make use of any recursion!!!
*)
(*
fun
sort5
(xs: int * int * int * int * int): int * int * int * int * int
*)

(* ****** ****** *)

(* Please present your code below *)

fun sort5 (xs : int * int * int * int * int) : int * int * int * int * int =
    case xs of
        (x1, x2, x3, x4, x5) =>
            let
                val (x1, x2) = sort1 (x1, x2)
                val (x2, x3) = sort2 (x2, x3)
                val (x3, x4) = sort3 (x3, x4)
                val (x4, x5) = sort4 (x4, x5)
                val (x1, x2) = sort1 (x1, x2)
                val (x2, x3) = sort2 (x2, x3)
                val (x3, x4) = sort3 (x3, x4)
                val (x1, x2) = sort1 (x1, x2)
                val (x2, x3) = sort2 (x2, x3)
                val (x1, x2) = sort1 (x1, x2)
            in
                (x1, x2, x3, x4, x5)
            end

fun sort1 (x1, x2) =
    if x1 > x2 then (x2, x1) else (x1, x2)

fun sort2 (x2, x3) =
    if x2 > x3 then (x3, x2) else (x2, x3)

fun sort3 (x3, x4) =
    if x3 > x4 then (x4, x3) else (x3, x4)

fun sort4 (x4, x5) =
    if x4 > x5 then (x5, x4) else (x4, x5)


(* ****** ****** *)
