(* ****** ****** *)

val strsub = String.sub

(* ****** ****** *)

(*A valid date string is of the format
"mm/dd/yyyy", where d, m, and y represent digits.
For instance, today's date is "05/31/2024".*)

(*
Given two date strings date1 and date2, the
following function returns -1, 0, or 1, if date1
is before, the same as, or after date2, respectively.
*)
		      
(*
fun
date_cmpr
( date1: string
, date2: string): int = raise NotImplemented
*)
(* ****** ****** *)

(*
Please give your implementation of [date_cmpr] below *)

(* ****** ****** *)

fun date_cmpr ( date1 : string, date2 : string) : int =
    let
        fun loopyear(index : int, date1 : string, date2 : string) : int =
            case index of
                4 => 
                    if strsub (date1, index) = strsub (date2, index) then 0         (*same date, checked last, ret 0*)
                    else if strsub (date1, index) > strsub (date2, index) then 1    (*date comes after, ret 1*)
                        else ~1                                                     (*date comes before, ret -1*)
              | 9 =>                                             
                    if strsub (date1, index) = strsub (date2, index) then
                        loopyear(0, date1, date2)                                   (*same year, move to months*)
                    else if strsub (date1, index) > strsub (date2, index) then 1    (*date comes after, ret 1*)
                        else ~1                                                     (*date comes before, ret -1*)
              | 1 => 
                    if strsub (date1, index) = strsub (date2, index) then
                        loopyear(3, date1, date2)                                   (*same year, move to months*)
                    else if strsub (date1, index) > strsub (date2, index) then 1    (*date comes after, ret 1*)
                        else ~1                                                     (*date comes before, ret -1*)
              | _ =>
                    if strsub (date1, index) = strsub (date2, index) then           (* comparisons in index 6, 7, 8, 1, 3 *)
                        loopyear(index + 1, date1, date2)                           (*move to next index*)
                    else if strsub (date1, index) > strsub (date2, index) then 1    (*date comes after, ret 1*)
                        else ~1                                                     (*date comes before, ret -1*)
    in 
        loopyear(6, date1, date2)      (* start loop at the year, then check months if years mathh, lastly check days *)
    end

(* main correction, account for case where no special transition from yr -> mth -> day is needed *)

(* end of [quizzes/quiz01/date_cmpr.sml] *)

