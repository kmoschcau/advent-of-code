open Shared

(** Parse a single line of the input into a report of levels. *)
let parse_line line =
  String.split_on_char ' ' line |> List.map (fun level -> int_of_string level)

(** Parse the lines of the input into reports of levels. *)
let parse_lines lines = List.map (fun line -> parse_line line) lines

(** Possible report states *)
type report_state =
  | Indeterminate
  | Initial of { index : int; last : int }
  | Increasing of { index : int; last : int }
  | Decreasing of { index : int; last : int }
  | Unsafe of { index : int }

(** An accumulator for safety checks without tolerance *)
let safety_check_acc state level =
  match state with
  | Indeterminate -> Initial { index = 0; last = level }
  | Initial { index; last } ->
      let next_index = index + 1 in
      let diff = level - last in
      if diff >= 1 && diff <= 3 then
        Increasing { index = next_index; last = level }
      else if diff >= -3 && diff <= -1 then
        Decreasing { index = next_index; last = level }
      else Unsafe { index = next_index }
  | Increasing { index; last } ->
      let next_index = index + 1 in
      let diff = level - last in
      if diff >= 1 && diff <= 3 then
        Increasing { index = next_index; last = level }
      else Unsafe { index = next_index }
  | Decreasing { index; last } ->
      let next_index = index + 1 in
      let diff = last - level in
      if diff >= 1 && diff <= 3 then
        Decreasing { index = next_index; last = level }
      else Unsafe { index = next_index }
  | Unsafe { index } -> Unsafe { index }

(** Check if the given report is safe. *)
let is_report_safe report =
  let state = List.fold_left safety_check_acc Indeterminate report in
  match state with Unsafe { index = _ } -> false | _ -> true

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

(** Check if the given report is safe with tolerance. *)
let is_report_safe_with_tolerance report =
  let state = List.fold_left safety_check_acc Indeterminate report in
  match state with
  | Unsafe { index } -> (
      let cleaned_report = List.filteri (fun i _ -> i <> index) report in
      let cleaned_state =
        List.fold_left safety_check_acc Indeterminate cleaned_report
      in
      match cleaned_state with Unsafe { index = _ } -> false | _ -> true)
  | _ -> true

(** Count all safe with tolerance reports. *)
let count_safe_with_tolerance_reports reports =
  List.fold_right
    (fun report valid_count ->
      match is_report_safe_with_tolerance report with
      | false -> valid_count
      | _ -> valid_count + 1)
    reports 0

(** Calculate the puzzle solution for part 2. *)
let p2 input =
  split_lines input |> parse_lines |> count_safe_with_tolerance_reports
