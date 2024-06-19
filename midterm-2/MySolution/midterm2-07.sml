(* ****** ****** *)

(*
HX: 10 points:
Given an infinite stream:
x1, x2, ..., x_n, ...,
Please construct another stream
(of pairs) containing (x_i, x_j)
where i and j range over natural
numbers. You need to give a BRIEF
argument as to why your implementation
will be able to enumerate every possible
pair.

fun
stream_all_pairs
(xs: 'a stream): ('a * 'a) stream
*)

fun stream_all_pairs (xs: 'a stream): ('a * 'a) stream =
    let 
        fun nxt (i, j) =
            case j of
                0   =>  (0, i+1)
              | _   =>  (i+1, j-1)
        
        fun aux (i, j) =
            strcon_cons((i,j)), fn () => aux(nxt(i, j)))
    in
        strcon_cons((0,0), fn () => aux(0,1))
    end

(* Mostly my corrections were syntactical, I changed the start call to include
   the next pair, so we dont have to call nxt twice at a time. otherwise same
*)

(* 
    the code aims to work by initializing at (0,0) and adding pairs by increasing
    i and decreasing j by one, to ensure we dont skip one, we get a set that sums
    to what j was initialized to, by increasing j we allow this to continue forever.
    by checking the addends to each sum, for every sum 0 and up, we are effectively
    checking possible natural number pair. all possible pairs of natural numbers 
    (i, j) are eventually enumerated because every new pair moves to a new combination 
    of i and j values without skipping any possible pair.
 *)

(* ****** ****** *)

(* end of [CS320-2024-Sum1-midterm2-07.sml] *)
