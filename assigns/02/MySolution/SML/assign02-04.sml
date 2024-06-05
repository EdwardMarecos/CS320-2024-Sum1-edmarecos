(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-04: 10 points
//
Please recall the following question in Assign01:
Assign01-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

fun isDigit( c : char ) : bool = 
    ord(c) >= ord #"0" andalso ord(c) <= ord #"9"

fun str2int_opt( cs : string ) : int option = 
    let
        val chars = explode(cs)
        fun loop ( cs : char list, acc : int) : int option =
            case cs of 
                nil         => SOME acc
              | c :: cs     => 
                    if isDigit(c) then loop (cs, acc * 10 + (ord(c) - ord(#"0")))
                    else NONE   
    in
        if cs = "" then NONE
        else loop (chars , 0)
    end
		
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-04.sml] *)
