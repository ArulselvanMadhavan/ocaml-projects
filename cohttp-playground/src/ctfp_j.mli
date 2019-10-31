(* Auto-generated from "ctfp.atd" *)
[@@@ocaml.warning "-27-32-35-39"]

type repo_info = Ctfp_t.repo_info = { id: int; name: string }

val write_repo_info :
  Bi_outbuf.t -> repo_info -> unit
  (** Output a JSON value of type {!repo_info}. *)

val string_of_repo_info :
  ?len:int -> repo_info -> string
  (** Serialize a value of type {!repo_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_repo_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> repo_info
  (** Input JSON data of type {!repo_info}. *)

val repo_info_of_string :
  string -> repo_info
  (** Deserialize JSON data of type {!repo_info}. *)

