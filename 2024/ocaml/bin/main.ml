let () =
  let contents =
    In_channel.with_open_bin "../inputs/d1.txt" In_channel.input_all
  in
  print_endline (string_of_int (Advent.D1p1.v contents))
