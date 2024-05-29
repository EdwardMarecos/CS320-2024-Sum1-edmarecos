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
        case (n <= 1, n = 2, n mod 2 = 0) of
            (true, _, _) => false       (* if n is 0 or negative it is not prime *)
          | (_, true, _) => true        (* 2 is the smallest prime number *)
          | (_, _, true) => false       (* if n is even, it is not prime *)
          | _            => notDivisible(3) 
            (* if none of our base cases pass, 
               we check for factors after 2, 
               we want it to not be divisible *)
    end


(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-02.sml] *)
