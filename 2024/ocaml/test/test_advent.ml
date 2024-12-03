open Advent
open Alcotest

let message = "when given the example input"
let d1_test_input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n"
let test_d1p1 () = (check int) message 11 (d1p1 d1_test_input)

let () =
  let open Alcotest in
  run "Advent"
    [ ("d1p1", [ ("Produces the correct result", `Quick, test_d1p1) ]) ]
