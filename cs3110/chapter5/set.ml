module type Set = sig
  type 'a t

  val empty : 'a t

  val mem : 'a -> 'a t -> bool

  val add : 'a -> 'a t -> 'a t

  val elts : 'a t -> 'a list
end

module ListSetDupsImpl : Set = struct
  type 'a t = 'a list

  let empty = []

  let mem = List.mem

  let add x s = x :: s

  let elts s = List.sort_uniq Pervasives.compare s
end

module ListSetDups : Set = ListSetDupsImpl

module ListSetDupsExtended = struct
  include ListSetDupsImpl

  let of_list lst = lst

  let rec elts' = function
    | [] -> []
    | h :: tl -> if mem h tl then elts' tl else h :: elts' tl
end

(* module type SetExtended = sig
 *   include Set
 *   val of_list : 'a list -> 'a t      
 * end *)
