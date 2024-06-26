(* ****** ****** *)
use "./../../assign05-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-14: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* helper function to insert an element into all positions in a list *)
fun insert_all_positions(x, []) = 
    [[x]]
  | insert_all_positions(x, y::ys) = (x::y::ys) :: (map (fn zs => y::zs) (insert_all_positions(x, ys)))

(* function to generate all permutations of a list using list_foldl *)
fun permutations(xs) =
  list_foldl(xs, [[]], fn (acc, x) => list_concat(map (insert_all_positions(x)) acc))

(* stream_permute_list: generate a stream of all permutations of a list *)
fun stream_permute_list(xs: 'a list): 'a list stream = 
    list_streamize(permutations(xs))

(* end of [CS320-2024-Sum1-assign05-01.sml] *)
