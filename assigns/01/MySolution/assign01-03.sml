(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
int2str
(x: int): string =
raise MyNotImplementedExn
*)

fun digit2str (i : int) : string = 
    str(chr((i mod 10) + 48))

fun int2str(i : int) : string =   
    let
        val isNeg : bool = i < 0
        val absVal : int = if isNeg then ~i else i
        fun loop (i : int, s : string, neg : bool) : string =
            case (i < 10, i >= 10, neg) of
                (true, _, false)    => strcat(digit2str(i), s)
              | (true, _, true)     => strcat("-", strcat(digit2str(i), s))
              | (_, true, _)        => loop (i div 10, strcat(digit2str(i mod 10), s), neg)
    in
        case i of
            0   => "0"
         |  _   => loop (absVal, "", isNeg)
    end


(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-03.sml] *)
