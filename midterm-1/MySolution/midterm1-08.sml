(* ****** ****** *)
use "./../../mylib/SML/mylib-cls.sml";
(* ****** ****** *)
(*
//
// HX-2024-06-11: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence [a,b,c] of xs
satisfying c < a < b. NOTE that a, b, and c
do not have to appear consecutively in xs.
//
For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
//
fun
perm_capture_231(xs: int list): bool = ...
//
*)
(* ****** ****** *)

fun perm_capture_231(xs : int list) : bool =
    let
        fun loopa (xsa, a) =
        let 
            fun loopb (xsb, a, b) =
            let
                fun loopc (xsc, a, b, c) =
                    case xsc of 
                        []          =>  c < a
                      | d :: xsd    =>  
                        case (c < a) of
                            true => true
                          |  _   => loopc(xsd, a, b, d)
            in
                case xsb of 
                    []          =>  false
                  | c :: xsc    =>  
                    case (a < b, loopc(xsc, a, b, c)) of
                        (true, true) => true
                      |  _           => loopb(xsc, a, c)
            end
        in 
            case xsa of 
                []          =>  false
              | b :: xsb    =>  
                case (loopb (xsb, a, b)) of
                    true => true
                  |  _   => loopa(xsb, b)
        end
    in
        case xs of
            []       => false
          | a :: xsa => loopa (xsa, a)
    end

(* corrections made
    in my original implementation you can see that i had my code
    organized a bit differently, the bottom segment of my initial 
    code is now in the let block, so rather than a loop based on
    cases looking at all three elements i now have my code seperated
    into loops to deal with their respective element. other than that
    change, the fundamentals are very similar, a base case of an empty
    list returns false for all except c, so we check the final element.
    i still have the comparisons of c < a < b, and move through the list
    at xsa, xsb, or xsc when the respective event occurs. i also finished
    it as it was incomplete in class :(
*)

(* some tests i ran
val tru1 = perm_capture_231([1,3,4,2]);        
val fal1 = perm_capture_231([1, 2, 3, 4, 5]);  
val tru2 = perm_capture_231([5, 3, 1, 4, 2]);  
val fal2 = perm_capture_231([3, 2, 1]);      
val fal3 = perm_capture_231([1, 2]);      *)


(* end of [CS320-2024-Sum1-midterm1-08.sml] *)
