open Base
    
type 'a t = 'a list * 'a list

let empty = ([], [])

let enqueue (in_list, out_list) x =
  (x :: in_list, out_list)

let dequeue (in_list, out_list) =
  match out_list with
  | hd :: tl -> Some (hd, (in_list, tl))
  | [] ->
    match List.rev in_list with
    | [] -> None
    | hd :: tl -> Some (hd, ([], tl))

let fold (in_list, out_list) ~init ~f =
  let after_out = List.fold ~init ~f out_list in
  List.fold_right ~init:after_out ~f:(fun x acc -> f acc x) in_list

module type T = sig
  type 'a t

  val fold: 'a t -> init:'a -> f:('b -> 'a -> 'b) -> 'b
end

(* module Make(T:T) = struct
 *   include T
 *   include Foldable.Extend(T)
 * end *)
