let split_lines input = String.split_on_char '\n' input

let parse_line line =
  let parts = String.split_on_char ' ' line |> List.filter (fun e -> e <> "") in
  match parts with
  | [ l; r ] -> (int_of_string l, int_of_string r)
  | _ -> failwith "The line was unbalanced."

let rec parse_lines input =
  match input with
  | [] -> ([], [])
  | line :: rest ->
      let left_int, right_int = parse_line line in
      let left_list, right_list = parse_lines rest in
      (left_int :: left_list, right_int :: right_list)

let sort_lists lists =
  match lists with
  | left_list, right_list ->
      (List.sort compare left_list, List.sort compare right_list)

let rec to_tuples lists =
  match lists with
  | [], [] -> []
  | [], _ :: _ | _ :: _, [] -> failwith "The lists where of different length."
  | left_int :: left_list, right_int :: right_list ->
      (left_int, right_int) :: to_tuples (left_list, right_list)

let distance one two = abs (one - two)

let acc numbers total =
  match numbers with left, right -> distance left right + total

let v input =
  let tuples = split_lines input |> parse_lines |> sort_lists |> to_tuples in
  List.fold_right acc tuples 0
