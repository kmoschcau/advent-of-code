(** Remove empty strings from the given list. *)
let remove_empty string = List.filter (fun s -> s <> "") string

(** Split an input into lines, removing empty lines. *)
let split_lines input = String.split_on_char '\n' input |> remove_empty

(** Parse a single line of the input format into a tuple of location IDs. *)
let parse_line line =
  let parts = String.split_on_char ' ' line |> remove_empty in
  match parts with
  | [ left_loc_id; right_loc_id ] ->
      (int_of_string left_loc_id, int_of_string right_loc_id)
  | _ -> failwith "The line was unbalanced."

(**
 * Parse the lines of the input into two lists of left and right location IDs.
 *)
let rec parse_lines lines =
  match lines with
  | [] -> ([], [])
  | line :: rest ->
      let left_loc_id, right_loc_id = parse_line line in
      let left_list, right_list = parse_lines rest in
      (left_loc_id :: left_list, right_loc_id :: right_list)

(** Sort the two location ID lists respectively. *)
let sort_lists lists =
  match lists with
  | left_list, right_list ->
      (List.sort compare left_list, List.sort compare right_list)

(** Transform the two location ID lists into a list of location ID tuples. *)
let rec to_list_of_tuples lists =
  match lists with
  | [], [] -> []
  | [], _ :: _ | _ :: _, [] -> failwith "The lists where of different length."
  | left_loc_id :: left_list, right_loc_id :: right_list ->
      (left_loc_id, right_loc_id) :: to_list_of_tuples (left_list, right_list)

(** Calculate the distance between two location IDs. *)
let distance loc_id_one loc_id_two = abs (loc_id_one - loc_id_two)

(** An accumulator for location ID tuples. *)
let distance_acc loc_ids total =
  match loc_ids with
  | left_loc_id, right_loc_id -> distance left_loc_id right_loc_id + total

(** Calculate the puzzle solution for part 1. *)
let p1 input =
  let tuples =
    split_lines input |> parse_lines |> sort_lists |> to_list_of_tuples
  in
  List.fold_right distance_acc tuples 0
