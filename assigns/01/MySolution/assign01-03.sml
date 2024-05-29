(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
int2str
(x: int): string =
raise MyNotImplementedExn
*)

fun int2str(i : int) : string =
    str(chr( (i mod 10) + 48 ))
    (*let
        val isNeg = i < 0
        val absVal = ~i if isNeg else i
        fun digit2char 
        fun loop (i : int, s : string) : string =
            case i of
                chr( (i mod 10) + 48 )
    in
        case *)



(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-03.sml] *)
(*val tst = int2str(89)*)