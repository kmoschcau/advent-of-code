open Advent
open Alcotest
open Shared

let d3_test_input =
  "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

let test_d3p1 () = (check int) message 161 (d3p1 d3_test_input)
let test_d3p2 () = (check int) message (-1) (d3p2 d3_test_input)

let () =
  run "Day 3"
    [
      ("Part 1", [ ("Produces the correct result", `Quick, test_d3p1) ]);
      ("Part 2", [ ("Produces the correct result", `Quick, test_d3p2) ]);
    ]
