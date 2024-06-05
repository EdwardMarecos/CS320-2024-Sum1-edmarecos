(* ****** ****** *)
use "./../../assign02-lib.sml";
(* ****** ****** *)
(*
Please manually copy your implementation
of xlist_size if you need it:
use "./../../MySolution/SML/assign02-01.sml";
*)
fun xlist_size ( xs : 'a xlist) : int =
    let
        fun loop(xs: 'a xlist, acc: int) : int =
            case xs of
                xlist_nil => acc
              | xlist_cons (_, xs') => loop(xs', acc + 1)
              | xlist_snoc (xs', _) => loop(xs', acc + 1)
              | xlist_append (xs1, xs2) => loop(xs2, loop(xs1, acc))
              | xlist_reverse xs' => loop(xs', acc)
    in
        loop(xs, 0)
    end
(* ****** ****** *)

(*
//
Assign02-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)

fun xlist_sub ( xs : 'a xlist , i0 : int ) : 'a = 
    let
        fun loop ( xs : 'a xlist , i0 : int) : 'a =
        case xs of
            xlist_nil                   => raise XlistSubscript
          | xlist_cons (x1, xs')        => if i0 = 0 then x1 else loop( xs', i0 - 1)
          | xlist_snoc (xs', x)         => 
                let
                    val xslen = xlist_size(xs')
                in
                    if i0 = xslen then x else loop(xs', i0)
                end
          | xlist_append (x1, y1)       =>
                let
                    val x1len = xlist_size(x1)
                in
                    if i0 < x1len then loop(x1, i0) else loop(y1, i0 - x1len)
                end
          | xlist_reverse (xs')         =>
                let
                    val xslen = xlist_size(xs')
                in
                    if 0 <= i0 andalso i0 < xslen then loop(xs', xslen - 1 - i0)
                    else raise XlistSubscript
                end          
    in
        if i0 < 0 then raise XlistSubscript
        else loop (xs, i0)
    end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-02.sml] *)
