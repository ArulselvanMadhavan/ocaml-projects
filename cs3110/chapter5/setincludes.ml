module type Set = sig
  type 'a t

  val empty : 'a t

  val mem : 'a -> 'a t -> bool

  val add : 'a -> 'a t -> 'a t

  val elts : 'a t -> 'a list
end

module AddAll (S : Set) = struct
  let add_all lst set =
    let add' s x = S.add x s in
    List.fold_left add' set lst
end

module ListSetNoDupsImpl = struct
  type 'a t = 'a list

  let empty = []

  let mem = List.mem

  let add x s = if mem x s then s else x :: s

  let elts s = s
end

module ListSetDupsImpl = struct
  type 'a t = 'a list

  let empty = []

  let mem = List.mem

  let add x s = x :: s

  let elts s = List.sort_uniq Pervasives.compare s
end

module type SetExtended = sig
  include Set

  val of_list : 'a list -> 'a t
end

module ListSetDups : Set = ListSetDupsImpl

module ListSetNoDups : Set = ListSetNoDupsImpl

module AddAllListSetDups = AddAll (ListSetDups)

module ListSetDupsExtended : SetExtended = struct
  include ListSetDupsImpl
  include AddAllListSetDups

  let of_list (lst : 'a list) : 'a t = lst
end

module AddAllListNoSetDups = AddAll (ListSetNoDups)

module ListSetNoDupsExtended : SetExtended = struct
  include ListSetNoDupsImpl
  include AddAllListNoSetDups

  let of_list (lst : 'a list) : 'a t = lst
end

module ExtendSet (S : Set) = struct
  include S

  let add_all lst set =
    let add' s x = S.add x s in
    List.fold_left add' set lst
end

module ListSetNoDupsExtended = ExtendSet (ListSetNoDups)
