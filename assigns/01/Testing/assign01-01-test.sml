(* ****** ****** *)

use "./../MySolution/assign01-01.sml";

(* ****** ****** *)

local
exception Error
in
(* ****** ****** *)
(*
// HX-2024-05-21:
// Note that '13' may need to be
// changed to another value.
*)
(* ****** ****** *)
val () =
if
(myans <> 13)
andalso
(myans <> 21)
then raise Error else ()
(* ****** ****** *)
val () = print("Assign01-01-test passed!\n")
(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Spring-assign01-01-test.sml] *)
