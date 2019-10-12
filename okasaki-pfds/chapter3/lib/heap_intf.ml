module type Ordered = sig
  type t[@@deriving show, eq]

  val eq : t * t -> bool

  val lt : t * t -> bool

  val leq : t * t -> bool
end

module type Heap = sig
  module Elem : Ordered

  type heap[@@deriving show, eq]

  val empty : heap

  val isEmpty : heap -> bool

  val insert : Elem.t * heap -> heap

  val merge : heap * heap -> heap

  val findMin : heap -> Elem.t option

  val deleteMin : heap -> heap option
end

module type Heap_intf = sig
  module type Ordered = Ordered

  module type Heap = Heap  
end
