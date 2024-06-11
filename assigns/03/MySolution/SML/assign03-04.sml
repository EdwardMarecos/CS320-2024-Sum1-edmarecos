(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that finds
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

*)

fun list_longest_ascend ( xs : int list ) : int list =
    let
        (* Helper function to compare two lists by length and return the longer one *)
        fun longer_seq(seq1: int list, seq2: int list): int list =
            if list_length(seq1) > list_length(seq2) then seq1 else seq2

        (* Main recursive function to find the longest ascending subsequence *)
        fun find_longest([], current_seq, longest_seq) =
                longer_seq(current_seq, longest_seq)
          | find_longest([x], current_seq, longest_seq) =
                longer_seq(x::current_seq, longest_seq)
          | find_longest(x1::x2::rest, current_seq, longest_seq) =
                if x2 >= x1 then
                    find_longest(x2::rest, x2::x1::current_seq, longest_seq)
                else
                    find_longest(x2::rest, [x2], longer_seq(x1::current_seq, longest_seq))

    in
        list_reverse (find_longest(xs, [], []))
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-04.sml] *)
val xs0 = [2, 1, 3, 3, 4, 4, 5]
val xs0t = list_longest_ascend(xs0)

val xs1 = [2, 1, 1, 3, 3, 2, 4, 4, 5]
val xs1t = list_longest_ascend(xs1)

val xs2 = [2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5]
val xs2t = list_longest_ascend(xs2)