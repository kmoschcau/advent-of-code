let day = ref ""
let part = ref ""

let speclist =
  [
    ("-d", Arg.Set_string day, "The day of the puzzle");
    ("-p", Arg.Set_string part, "The part of the day");
    ("--day", Arg.Set_string day, "The day of the puzzle");
    ("--part", Arg.Set_string part, "The part of the day");
  ]

let anon_fun _ = invalid_arg "Invalid argument."
let () = Arg.parse speclist anon_fun "advent -d <day> -p <part>"
let input_base_path = Filename.concat ".." "inputs"

let input_file =
  match !day with
  | "1" -> "d1.txt"
  | "2" -> "d2.txt"
  | "3" -> "d3.txt"
  | _ -> invalid_arg "Invalid day"

let func =
  match (!day, !part) with
  | "1", "1" -> Advent.d1p1
  | "1", "2" -> Advent.d1p2
  | "2", "1" -> Advent.d2p1
  | "2", "2" -> Advent.d2p2
  | "3", "1" -> Advent.d3p1
  | "3", "2" -> Advent.d3p2
  | _ -> invalid_arg "Invalid part"

let () =
  let contents =
    In_channel.with_open_bin
      (Filename.concat input_base_path input_file)
      In_channel.input_all
  in
  print_endline (string_of_int (func contents))
