(*
Your solution for question 1.1
*)
(* ************************************************ *)
use "./../../../lectures/lec-06-03/mylib-06-03.sml";
(* ************************************************ *)

(*

Q1.1

fun
str2int(rep: string): int

Please give a non-recursive combinator-based
implementation of str2int, which str2int is described
in Assign01. No error-handling is needed.

*)

fun str2int ( rep : string ) : int =
    let 
        val chars = explode(rep)
    in
        listfoldl(chars, 0, fn(acc, ch1) =>
            acc * 10 + (ord(ch1)-ord(#"0")))
    end

(* my updates was writing the let, in, end, and removing cases, 
and correcting the ord(0) to ord(#"0")*)
