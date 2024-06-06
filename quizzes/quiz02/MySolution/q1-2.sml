(*
Your solution for question 1.2
*)
(* ************************************************ *)

use "./../../../lectures/lec-06-03/mylib-06-03.sml";

(* ************************************************ *)

(*

Q1.2

fun
int2str(i0: int): string

Please give a non-recursive combinator-based
implementation of int2str, which int2str is described
in Assign01. No error-handling is needed.

You can use the following functions in the SML library:

fun implode(char list): string

*)

fun int2str (i0 : int) : string =
    int1_foldleft(i0, "", fn(acc, i) =>
        let
            val rem = i mod 10
        in
            case i0 of
                0       => acc
              | _       => implode(chr(ord#"0" + rem)) ^ acc

        end
    )

(* corrections included writing 'end', fixing the implode input *)