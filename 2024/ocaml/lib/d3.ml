let naive_regex =
  let open Re in
  compile
    (seq
       [
         str "mul(";
         group (repn digit 1 (Some 3));
         str ",";
         group (repn digit 1 (Some 3));
         str ")";
       ])

(** Calculate the puzzle solution for part 1. *)
let p1 input =
  let matches = Re.all naive_regex input in
  let acc re_match total =
    total
    + int_of_string (Re.Group.get re_match 1)
      * int_of_string (Re.Group.get re_match 2)
  in
  List.fold_right acc matches 0

(* ========================================================================== *)

(** Calculate the puzzle solution for part 2. *)
let p2 _ = 0
