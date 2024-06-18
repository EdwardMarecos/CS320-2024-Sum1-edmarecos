(* ****** ****** *)
use "./../../assign04-lib.sml";
(* ****** ****** *)

(*
HX-2024-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* fun stream_ziplst( sl = 'a stream list ) : 'a list stream =
    (* list_foldleft(sl, strcon_nil, fn (acc, s0) =>
        strcons(s0, acc)
    ) *)
    let
        fun unzip_streams([]) = ([], [])
            | unzip_streams(s :: ss) =
                let
                    val h = strcon_head(s())
                    val t = strcon_tail(s())
                    val (heads, tails) = unzip_streams(ss)
                in
                    (h :: heads, t :: tails)
                end

    in
        aux(sl)
    end *)
(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign04-08.sml] *)


val s1 = fn () => strcon_cons(1, fn () => 
                  strcon_cons(2, fn () => 
                  strcon_cons(3, fn () => 
                  strcon_nil)))
val s2 = fn () => strcon_cons(4, fn () => 
                  strcon_cons(5, fn () => 
                  strcon_cons(6, fn () => 
                  strcon_nil)))
val s3 = fn () => strcon_cons(7, fn () => 
                  strcon_cons(8, fn () => 
                  strcon_cons(9, fn () => 
                  strcon_nil)))

val sL = [s1, s2, s3]
fun unzip_streams([]) = 
    ([], [])
    | unzip_streams(s :: ss) =
        let
            val h : int = strcon_head(s())
            val t = strcon_tail(s())
            val (heads, tails) = unzip_streams(ss)
        in
            print("Extracted head: "^Int.toString(h)^"\n")
            (h :: heads, t :: tails)
        end


val result = unzip_streams(sL)
