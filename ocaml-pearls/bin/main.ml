

let () =
  let x = Smallest_free_number.minfree [6;1;2;3;4] in
  Printf.printf "\nSmallest_free_number - %d\n" x
