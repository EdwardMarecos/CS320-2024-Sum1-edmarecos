(* ****** ****** *)
use "./../../assign03-lib.sml";
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)    

fun find_root( f0 : int -> int ) : int =
    let
        fun loop ( root : int, f0 : int -> int ) : int =
            case (f0(root) = 0, f0(~root) = 0) of
                (true, _)   =>  root
              | (_, true)   =>  ~root
              | _   =>  loop(root + 1, f0)
    in
        loop(0, f0)
    end
            
(* ****** ****** *)
(* end of [CS320-2024-Sum1-assign03-01.sml] *)