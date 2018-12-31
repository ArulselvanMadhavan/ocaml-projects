module type OrderedType = sig
  type t

  val compare : t -> t -> int
end

module type S = sig
  type key

  type 'a t

  val empty : 'a t

  val mem : key -> 'a t -> bool

  val add : key -> 'a -> 'a t

  val find : key -> 'a t -> 'a
end

type name = {first: string; last: string}

module Name = struct
  type t = name

  let compare {first= first1; last= last1} {first= first2; last= last2} =
    match Pervasives.compare last1 last2 with
    | 0 -> Pervasives.compare first1 first2
    | c -> c
end
