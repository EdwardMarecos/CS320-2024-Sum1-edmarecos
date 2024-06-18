(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)

val theNatPairs : ( int * int ) stream = 
    let 
        fun acc (i : int, j : int) : (int * int) =
        (*  if j is zero, we've exhausted the natural pairs of 
            i and j such that their sum = ij -- for instance 
            (0,0) = 0, 
            (0,1), (1,0) = 1, 
            (0,2), (1,1), (2,0) = 2 ... and so on
        *)
            case (j=0) of
                true => (0, i + 1)
              | _    => (i+1, j-1)

        fun aux ( i : int, j : int ) : ( int * int) stream =
        (* generate stream beginning with (0,0) and build up *)
            fn () => strcon_cons((i, j), aux(acc(i, j)))
    in
        (* initialize it at 0,0 *)
        aux(0, 0)
    end

(* fun
check1
( ij: int
, fxs: (int*int) stream): int =
let
val
strcon_cons((i, j), fxs) = fxs()
in
  if i + j < ij
  then (i+j) + check1(ij, fxs) else 0
end
(* ****** ****** *)
val () =
(
print("check1(9) = ");
print(int2string(check1(9, theNatPairs))); print("\n"))
val () =
(
print("check1(10) = ");
print(int2string(check1(10, theNatPairs))); print("\n"))
val () =
(
print("check1(11) = ");
print(int2string(check1(11, theNatPairs))); print("\n")) *)
(* end of [CS320-2024-Sum1-assign04-05.sml] *)
