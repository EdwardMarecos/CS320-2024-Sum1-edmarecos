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

fun find_root( f0 : int -> int) : int =
    if f0(0) = 0 then 0 else
            int1_foldleft(100, 0, fn(acc, f1) =>
                case (f0(f1) = 0, f0(~f1) = 0) of
                    (true, _)   => f1
                | (_, true)   => ~f1
                |  _          => acc
        )
    if f0(0) = 0 then 0 else
        val root = 0
        int1_foreach(100, fn(acc, root) =>
            case (f0(root) = 0, f0(~root) = 0) of
                (true, _)   => 
              | (_, true)   => false
              |  _          => true
            )
            
(* ****** ****** *)
val test0 = find_root(fn(x:int) => x*(x+2))
val testng2 = find_root(fn(x:int) => (x+2)*(x-3))
val test3 = find_root(fn(x:int) => (x+3)*(x-3))
(* end of [CS320-2024-Sum1-assign03-01.sml] *)
(* val testr = is_root(fn(x:int) => (x+3)*(x-3), 3) *)