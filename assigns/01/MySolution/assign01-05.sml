(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
stringrev
(cs: string): string =
raise MyNotImplementedExn
*)

(* ****** ****** *)
fun stringrev (cs : string): string =
    let
        fun reverser (s : string, i : int, acc : string) : string =
            if i < 0 then acc
            else reverser(s, i - 1, strcat(acc, str(strsub(s, i))))
    in
        reverser(cs, strlen(cs) - 1, "")
    end

(* end of [CS320-2024-Sum1-assign01-05.sml] *)
