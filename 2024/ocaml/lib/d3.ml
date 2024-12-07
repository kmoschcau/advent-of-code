(** The uncompiled regular expression for a mul-expression. *)
let mul_regex_t =
  let open Re in
  seq
    [
      group (str "mul");
      str "(";
      group (repn digit 1 (Some 3));
      str ",";
      group (repn digit 1 (Some 3));
      str ")";
    ]

(** The compiled regular expression for a multiplication expression. *)
let mul_regex = Re.compile mul_regex_t

(**
  An accumulator that multiplies the match groups of a multiplication
  expression regex and adds them to the total.
*)
let add_multiplication total match_group =
  match Re.Group.all match_group with
  | [| _; "mul"; left; right |] ->
      total + (int_of_string left * int_of_string right)
  | _ -> failwith "Invalid expression"

(** Calculate the puzzle solution for part 1. *)
let p1 input =
  let matches = Re.all mul_regex input in
  List.fold_left add_multiplication 0 matches

(* ========================================================================== *)

(** The uncompiled regular expression for a do-expression. *)
let do_regex_t =
  let open Re in
  seq [ group (str "do"); str "()" ]

(** The compiled regular expression for a do-expression. *)
let do_regex = Re.compile do_regex_t

(** The uncompiled regular expression for a don't-expression. *)
let dont_regex_t =
  let open Re in
  seq [ group (str "don't"); str "()" ]

(** The compiled regular expression for a don't-expression. *)
let dont_regex = Re.compile dont_regex_t

(** The uncompiled regular expression for all three expressions. *)
let complex_regex_t =
  let open Re in
  alt [ mul_regex_t; do_regex_t; dont_regex_t ]

(** The compiled regular expression for all three expressions. *)
let complex_regex =
  let open Re in
  compile complex_regex_t

(** Calculate the puzzle solution for part 2. *)
let p2 input =
  let matches = Re.matches complex_regex input in
  let acc accumulator match_str =
    let enabled, total = accumulator in
    if String.starts_with ~prefix:"mul" match_str then
      if enabled then
        (enabled, add_multiplication total (Re.exec mul_regex match_str))
      else accumulator
    else if String.starts_with ~prefix:"don't" match_str then (false, total)
    else if String.starts_with ~prefix:"do" match_str then (true, total)
    else failwith "Unknown expression"
  in
  let _, total = List.fold_left acc (true, 0) matches in
  total
