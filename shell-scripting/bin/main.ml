open Shexp_process
open Shexp_process.Infix
   
(* Check if exe is in PATH *)
let command (exe: string) : bool t =
  find_executable exe >>| fun exe -> exe <> None
                                   
let () =
  let fork_result = fork (command "dune") (command "ocamlformat") >>| function
  | (true, true) -> "found"
  | (_, _) -> "not found" in
  print_string (eval fork_result)
