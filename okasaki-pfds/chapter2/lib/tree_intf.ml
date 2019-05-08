module type Tree = sig
  type elem

  type tree = E | T of tree * elem * tree
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

module type SetUsingTree = sig
  include Tree

  include Set with type set = tree and type elem := elem
end

module type Tree_intf = sig
  module type Tree = Tree

  module type Set = Set

  module type Ordered = Ordered

  module type SetUsingTree = SetUsingTree

  module UnbalancedSet (O : Ordered) : SetUsingTree with type elem = O.t
end
