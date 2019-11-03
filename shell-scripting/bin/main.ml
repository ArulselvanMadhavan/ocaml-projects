open Shexp_process
open Shexp_process.Infix
   
(* Check if exe is in PATH *)
let command (exe: string) : bool t =
  find_executable exe >>| fun exe -> exe <> None
                                   
let () =
  print_string (Printf.sprintf "Result: %b" (eval (command "ocamlformat")))
