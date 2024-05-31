type date =
{year: int, month: int, day: int}
	 
val today = {year=2024, month=5, day=31}

exception NotImplemented
(*
//
Year X is a leap year if
(1) X is a mutiple of 400, or
(2) X is a mutiple of 4 but not a mutiple of 100
For instance, year 2024 is a leap year.
//
In a leap year, there are 29 days in February.
In a non-leap year, there are only 28 days in February.
//
*)
(*
Given a valid date of a day, [date_succ] returns
the date of the following day.
*)
(*
fun
date_succ(date: date): date = raise NotImplemented
*)
(* ****** ****** *)

(*
Please give your implementation of [date_succ] below *)

(* ****** ****** *)
fun date_succ( date : date) : date =
    let 
        fun makeDate(year : int, month: int, day : int) : date =
            val date_succ = {year = year, month = month, day = day}
    in 
        case date (year mod 4 = 0, month mod 2 = 1, month = 2, month = 12, day = 30, day = 31, day = 28, day = 29, month = 8)
            (true, _, true, _, _, _, _, true, _)   => makeDate(year, 3, 1)             (* feb 29 to march 1*)
          | (false, _, true, _, _, _, true, _, _)  => makeDate(year, 3, 1)             (* feb 28 to march 1 on non leap year*)
          | (_, _, _, true, _, true, _, _, _)      => makeDate(year + 1, 1, 1)         (* dec 31 to jan 1 new year*)
          | (_, _, _, _, _, true, _, _, _)         => makeDate(year, month + 1, 1)     (* months with 31 days to next month*)
          | (_, _, _, _, _, _, _, _, true)         => makeDate(year, month + 1, 1)     (* august*)
          | (_, false, _, _, true, _, _, _, _)     => makeDate(year, month + 1, 1)     (* other months *)
          | _                                       => makeDate(year, month, day + 1)  (*days that progress as normal *)

(* end of [quizzes/quiz01/date_succ.sml] *)

