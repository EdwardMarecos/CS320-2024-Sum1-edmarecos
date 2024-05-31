(* ****** ****** *)
use "./../MySolution/assign01-02.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

val () =
if (isPrime(5) <> true) then raise Error else ()
val () =
if (isPrime(7) <> true) then raise Error else ()
val () =
if (isPrime(57) <> false) then raise Error else ()
val () =
if (isPrime(101) <> true) then raise Error else ()
val () =
if (isPrime(1001) <> false) then raise Error else ()
val () =
if (isPrime(10001) <> false) then raise Error else ()

(* ****** ****** *)
val () = print("Assign01-02-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-02-test.sml] *)
