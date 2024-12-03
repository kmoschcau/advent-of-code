let test_d1p1 () =
  let message = "wrong result" in
  let input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3\n" in
  let expected = 11 in
  Alcotest.(check int) message expected (Advent.D1p1.v input)

let () =
  let open Alcotest in
  run "Advent"
    [ ("d1p1", [ ("Produces the correct result", `Quick, test_d1p1) ]) ]
