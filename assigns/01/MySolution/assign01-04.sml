(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
str2int
(cs: string): int =
raise MyNotImplementedExn
*)

fun str2int (s : string) : int =
    let
        fun loop (index : int, value : int, length : int, neg : bool) : int =
            if index = length 
            then
                value
            else
                let
                    val add = ord (strsub (s, index)) - ord #"0"
                    val newValue = value * 10 + add
                in
                    loop (index + 1, newValue, length, neg)
                end
        val length = strlen s
        val neg = strlen s > 0 andalso strsub (s, 0) = #"-"
    in
        if length = 0 
        then
            0
        else
            let
                val result = loop (if neg then 1 else 0, 0, length, neg)
            in
                if neg then ~result else result
            end
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-04.sml] *)
