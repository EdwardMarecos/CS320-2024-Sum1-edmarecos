(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

fun xlist_remove_reverse (xs: 'a xlist): 'a xlist = 
    let
        (* Helper function to manually reverse an 'a xlist *)
        fun reverse_xlist(xs: 'a xlist): 'a xlist =
            let
                fun reverse_loop(xs: 'a xlist, acc: 'a xlist): 'a xlist =
                    case xs of
                        xlist_nil => acc
                      | xlist_cons (x, xs') => reverse_loop(xs', xlist_cons(x, acc))
                      | xlist_snoc (xs', x) => reverse_loop(xs', xlist_snoc(acc, x))
                      | xlist_append (xs1, xs2) => xlist_append(reverse_loop(xs2, acc), reverse_loop(xs1, xlist_nil))
                      | xlist_reverse xs' => reverse_loop(xs', acc)
                in
                    reverse_loop(xs, xlist_nil)
                end

        fun reconstruct(xs: 'a xlist, ys: 'a xlist): 'a xlist =
            case xs of
                xlist_nil => ys
              | xlist_cons (x, xs') => reconstruct(xs', xlist_append(ys, xlist_cons(x, xlist_nil)))
              | xlist_snoc (xs', x) => reconstruct(xs', xlist_append(ys, xlist_snoc(xlist_nil, x)))
              | xlist_append (xs1, xs2) => reconstruct(xs2, reconstruct(xs1, ys))
              | xlist_reverse xs' => reconstruct(reverse_xlist(xs'), ys)
    in
        reconstruct(xs, xlist_nil)
    end
					   
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-03.sml] *)
