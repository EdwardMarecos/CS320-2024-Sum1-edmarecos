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
            {year = year, month = month, day = day}
        val {year = yr, month = mth, day = dy} = date
    in 
        case (yr mod 4 = 0, mth mod 2 = 1, mth = 2, mth = 12, dy = 30, dy = 31, dy = 28, dy = 29, mth = 8) of
            (true, _, true, _, _, _, _, true, _)   => makeDate(yr, 3, 1)            (* feb 29 to march 1 *)
          | (false, _, true, _, _, _, true, _, _)  => makeDate(yr, 3, 1)            (* feb 28 to march 1 on non leap year *)
          | (_, _, _, true, _, true, _, _, _)      => makeDate(yr + 1, 1, 1)        (* dec 31 to jan 1 new year *)
          | (_, _, _, _, _, true, _, _, _)         => makeDate(yr, mth + 1, 1)      (* months with 31 days to next month *)
          | (_, _, _, _, _, _, _, _, true)         => makeDate(yr, mth + 1, 1)      (* august*)
          | (_, false, _, _, true, _, _, _, _)     => makeDate(yr, mth + 1, 1)      (* other months *)
          | _                                      => makeDate(yr, mth, dy + 1)     (* days that progress as normal *)
    end

(* main correction change some variable names for easier distinction for me, and properly extract data from date *)
(* end of [quizzes/quiz01/date_succ.sml] *)

