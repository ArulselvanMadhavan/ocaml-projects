open Lib
    
let () =
  let result = Math.add 2 4 in
  print_endline (string_of_int result);
  let result = Math.add 3 1 in
  print_endline (string_of_int result);
