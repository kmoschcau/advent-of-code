open Advent
open Alcotest
open Shared

let d2_test_input =
  "7 6 4 2 1\n1 2 7 8 9\n9 7 6 2 1\n1 3 2 4 5\n8 6 4 4 1\n1 3 6 7 9\n"

let test_is_report_safe_1 () =
  (check bool) "when given 7 6 4 2 1" true (D2.is_report_safe [ 7; 6; 4; 2; 1 ])

let test_is_report_safe_2 () =
  (check bool) "when given 1 2 7 8 9" false
    (D2.is_report_safe [ 1; 2; 7; 8; 9 ])

let test_is_report_safe_3 () =
  (check bool) "when given 9 7 6 2 1" false
    (D2.is_report_safe [ 9; 7; 6; 2; 1 ])

let test_is_report_safe_4 () =
  (check bool) "when given 1 3 2 4 5" false
    (D2.is_report_safe [ 1; 3; 2; 4; 5 ])

let test_is_report_safe_5 () =
  (check bool) "when given 8 6 4 4 1" false
    (D2.is_report_safe [ 8; 6; 4; 4; 1 ])

let test_is_report_safe_6 () =
  (check bool) "when given 1 3 6 7 9" true (D2.is_report_safe [ 1; 3; 6; 7; 9 ])

let test_d2p1 () = (check int) message 2 (d2p1 d2_test_input)

let test_is_report_safe_with_tolerance_1 () =
  (check bool) "when given 7 6 4 2 1" true
    (D2.is_report_safe_with_tolerance [ 7; 6; 4; 2; 1 ])

let test_is_report_safe_with_tolerance_2 () =
  (check bool) "when given 1 2 7 8 9" false
    (D2.is_report_safe_with_tolerance [ 1; 2; 7; 8; 9 ])

let test_is_report_safe_with_tolerance_3 () =
  (check bool) "when given 9 7 6 2 1" false
    (D2.is_report_safe_with_tolerance [ 9; 7; 6; 2; 1 ])

let test_is_report_safe_with_tolerance_4 () =
  (check bool) "when given 1 3 2 4 5" true
    (D2.is_report_safe_with_tolerance [ 1; 3; 2; 4; 5 ])

let test_is_report_safe_with_tolerance_5 () =
  (check bool) "when given 8 6 4 4 1" true
    (D2.is_report_safe_with_tolerance [ 8; 6; 4; 4; 1 ])

let test_is_report_safe_with_tolerance_6 () =
  (check bool) "when given 1 3 6 7 9" true
    (D2.is_report_safe_with_tolerance [ 1; 3; 6; 7; 9 ])

let test_d2p2 () = (check int) message 4 (d2p2 d2_test_input)

let () =
  run "Day 2"
    [
      ( "Part 1",
        [
          ("Checks report safety correctly", `Quick, test_is_report_safe_1);
          ("Checks report safety correctly", `Quick, test_is_report_safe_2);
          ("Checks report safety correctly", `Quick, test_is_report_safe_3);
          ("Checks report safety correctly", `Quick, test_is_report_safe_4);
          ("Checks report safety correctly", `Quick, test_is_report_safe_5);
          ("Checks report safety correctly", `Quick, test_is_report_safe_6);
          ("Produces the correct result", `Quick, test_d2p1);
        ] );
      ( "Part 2",
        [
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_1 );
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_2 );
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_3 );
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_4 );
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_5 );
          ( "Checks report safety correctly with tolerance",
            `Quick,
            test_is_report_safe_with_tolerance_6 );
          ("Produces the correct result", `Quick, test_d2p2);
        ] );
    ]
