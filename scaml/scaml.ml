
open Shexp_process
(* open Shexp_process.Infix *)

let main : unit t =
  echo "Hello World from Ocaml!"

let () =
  eval main
