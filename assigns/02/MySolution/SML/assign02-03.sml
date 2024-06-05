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

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    let
        (* Tail-recursive helper function with accumulator and reverse state toggle *)
        fun process(xs: 'a xlist, acc: 'a xlist, isReversed: bool): 'a xlist =
            case xs of
                xlist_nil => acc
              | xlist_cons(x, xs') =>
                    if isReversed then
                        process(xs', xlist_snoc(acc, x), isReversed)
                    else
                        process(xs', xlist_cons(x, acc), isReversed)
              | xlist_snoc(xs', x) =>
                    if isReversed then
                        process(xs', xlist_cons(x, acc), isReversed)
                    else
                        process(xs', xlist_snoc(acc, x), isReversed)
              | xlist_append(xs1, xs2) =>
                    let
                        val leftProcessed = process(xs1, xlist_nil, isReversed)
                        val rightProcessed = process(xs2, acc, isReversed)
                    in
                        xlist_append(leftProcessed, rightProcessed)
                    end
              | xlist_reverse(xs') => process(xs', acc, not isReversed)
    in
        process(xs, xlist_nil, false)
    end
					   
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-03.sml] *)
