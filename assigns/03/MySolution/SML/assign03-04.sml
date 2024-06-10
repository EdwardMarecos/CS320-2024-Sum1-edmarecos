(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

*)

fun list_longest_ascend ( xs : int list ) : int list =
    let 
        fun update_longest(current, longest) =
            if list_length(current) > list_length(longest) then current 
            else longest
    (* function to check if a bigger subsequence was found *)
    (* Recursive function to process the list *)
    fun process([], current, longest) = 
        update_longest(current, longest)
      | process(x::xs, current, longest) =
          if null(current) orelse x >= List.last(current) then
            process(xs, current @ [x], longest)
          else
            process(xs, [x], update_longest(current, longest))
  in
    process(xs, [], [])
  end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign03-04.sml] *)
