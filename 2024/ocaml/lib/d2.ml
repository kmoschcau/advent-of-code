open Shared

(** Parse a single line of the input into a report of levels. *)
let parse_line line =
  String.split_on_char ' ' line |> List.map (fun level -> int_of_string level)

(** Parse the lines of the input into reports of levels. *)
let parse_lines lines = List.map (fun line -> parse_line line) lines

(** Possible report states *)
type report_state =
  | Indeterminate
  | Initial of int
  | Increasing of int
  | Decreasing of int
  | Unsafe

(** Check if the given report is safe. *)
let is_report_safe report =
  let state =
    List.fold_left
      (fun state level ->
        match state with
        | Indeterminate -> Initial level
        | Initial last ->
            let diff = level - last in
            if diff >= 1 && diff <= 3 then Increasing level
            else if diff >= -3 && diff <= -1 then Decreasing level
            else Unsafe
        | Increasing last ->
            let diff = level - last in
            if diff >= 1 && diff <= 3 then Increasing level else Unsafe
        | Decreasing last ->
            let diff = last - level in
            if diff >= 1 && diff <= 3 then Decreasing level else Unsafe
        | _ -> Unsafe)
      Indeterminate report
  in
  match state with Unsafe -> false | _ -> true

(** Count all safe reports. *)
let count_safe_reports reports =
  List.fold_right
    (fun report valid_count ->
      match is_report_safe report with
      | false -> valid_count
      | _ -> valid_count + 1)
    reports 0

(** Calculate the puzzle solution for part 1. *)
let p1 input = split_lines input |> parse_lines |> count_safe_reports

(* ========================================================================== *)

(** Calculate the puzzle solution for part 2. *)
let p2 input =
  let _ = split_lines input in
  0
