(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
isPrime
(n0: int): bool =
raise MyNotImplementedExn
*)

fun isPrime(n : int) : bool =
    let
        fun notDivisible(k : int) : bool =
            case (k * k > n, n mod k = 0) of
                (true, _) => true                  
                (* if k^2 then we checked every possible 
                   divisor from 2 to sq of n, not divisible *)
              | (_, true) => false
                (* if we found a factor, n is divisible *)
              | (_, false) => notDivisible(k + 2)
                (* we continue searching through odd numbers
                   as even numbers cannot be factors, we 
                   checked 2 already *)
    in
    (* check base conditions first *)
        if n <= 1 then
            (* if n is 0 or negative it is not prime *)
            false
        else 
            if 
                (* 2 is the smallest prime number *)
                n = 2 
            then
                true
        else
            if
                (* if n is even, it is not prime *)
                n mod 2 = 0
            then
                false
        else
            notDivisible(3)
            (* if none of our base cases pass, 
               we check for factors after 2, 
               we want it to not be divisible *)
    end


(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-02.sml] *)
