(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-01: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

val the_ln2_stream : real stream = 
    let
        fun term ( n : int ) : real =
        (* Calculate the term based on index n *)
            if n mod 2 = 0 then
                ~1.0 / int2real(n)
            else
                1.0 / int2real(n)

        fun aux ( n : int , sum : real ) : real stream =
        (* Generate the stream with cumulative sum *)
            fn () => strcon_cons(sum, aux(n + 1, sum + term(n)))
    in
        aux(2, 1.0)
        (*  start with index 2 for first item and initial sum 1.0 
            so that we start with a sum of 1, and first calculation
            is sum (1) - ( 1 divided by 2 ) 
        *)
    end

(*
some testing i used
val fxs = the_ln2_stream
(* ****** ****** *)

val strcon_cons(x1, fxs) = fxs()
val () = print("x1 1 = "^Real.toString(x1)^"\n")
val strcon_cons(x1, fxs) = fxs()
val () = print("x1 2 = "^Real.toString(x1)^"\n")
val strcon_cons(x1, fxs) = fxs()
val () = print("x1 3 = "^Real.toString(x1)^"\n")
val strcon_cons(x1, fxs) = fxs()
val () = print("x1 4 = "^Real.toString(x1)^"\n")
val strcon_cons(x1, fxs) = fxs()
val () = print("x1 5 = "^Real.toString(x1)^"\n")
val strcon_cons(x1, fxs) = fxs()
val () = print("x1 6 = "^Real.toString(x1)^"\n") 
*)

(* end of [CS320-2024-Sum1-assign04-04.sml] *)
