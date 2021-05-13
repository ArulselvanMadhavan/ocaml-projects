open Shexp_process
open Shexp_process.Infix
   
(* Check if exe is in PATH *)
let command (exe: string) : bool t =
  find_executable exe >>| fun exe -> exe <> None

let ctfp_dir = "/Users/arul.madhavan/dev/ocaml-projects/ocaml-ctfp/chapter21/"

let ext = "ml"
(* Pass a list of snippets *)
let snippet_dir:string = ctfp_dir ^ (Printf.sprintf "snippet*.%s" ext)
                       
let run_dune_test =
  chdir ctfp_dir (run "dune" ["runtest"; "--auto-promote"])

let run_mdx =
  chdir ctfp_dir (run "ocaml-mdx" ["test";"--prelude=prelude.ml";"--direction=to-ml"; "README.md";"--verbosity=debug"])

let run_formatter =
  run "ocamlformat" [snippet_dir; "--inplace"; "--root=/Users/arul.madhavan/dev/ocaml-projects/ocaml-ctfp"]  
        
let get_snippets =
  chdir ctfp_dir (run "git" ["ls-files"] |- run "grep" [Printf.sprintf "\\.%s$" ext])
  
let () =
  let fork_result = fork (command "dune") (command "ocamlformat") >>= function
  | (true, true) -> run_dune_test >> run_mdx >> get_snippets
  | (_, _) -> print "not found" in
  (eval fork_result)
