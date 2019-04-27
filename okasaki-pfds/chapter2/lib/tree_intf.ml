module type Tree = sig
  type 'a tree = E | T of 'a tree * 'a * 'a tree
end

module type Set = sig
  type elem

  type set

  val empty : set

  val insert : elem * set -> set

  val member : elem * set -> bool
end

module type Ordered = sig
  type t

  val eq : t * t -> bool

  val lt : t * t -> bool

  val leq : t * t -> bool
end

module type Tree_intf = sig
  module UnbalancedSet (O : Ordered) : Set
end
