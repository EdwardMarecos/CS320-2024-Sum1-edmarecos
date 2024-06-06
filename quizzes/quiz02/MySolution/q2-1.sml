(*
Your solution for question 1.2
*)
(* ************************************************ *)

use "./../../../lectures/lec-06-03/mylib-06-03.sml";

(* ************************************************ *)

(*

Q2.1
A string is a palindrome if the string equals
its reverse. The following function test whether
a given input string is a palindrome:

fun
palindromeq(input: string): bool

Please give a non-recursive combinator-based
implementation of palindromeq. No string equality
is allowed.

*)

fun palindromeq (input : string) : bool =
        let
            val rev = string_foldleft(input, "", fn(in, acc) => implode([in]) ^ acc)
        in
            string_forall (input, fn (ch, i) =>
                strsub(implode(rev), i) = ch)
        end

(* corrections included writing 'end', "=> implode([in]) ^ acc)" at the 
end of the rev declaration, and moving the for all into the 'in' and instead
of case use strsub to directly compare vals
*)