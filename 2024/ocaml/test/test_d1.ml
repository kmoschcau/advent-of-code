open Advent
open Alcotest
open Shared

let d1_test_input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n"
let test_d1p1 () = (check int) message 11 (d1p1 d1_test_input)
let test_d1p2 () = (check int) message 31 (d1p2 d1_test_input)

let () =
  run "Day 1"
    [
      ("Part 1", [ ("Produces the correct result", `Quick, test_d1p1) ]);
      ("Part 2", [ ("Produces the correct result", `Quick, test_d1p2) ]);
    ]
