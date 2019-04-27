module type Stack = sig
  type 'a t

  val empty : 'a t

  val isEmpty : 'a t -> bool

  val cons : 'a * 'a t -> 'a t

  val head : 'a t -> 'a

  val tail : 'a t -> 'a t
end

module type Stack_intf = sig
  module type Stack = Stack

  module List : Stack

  module CustomStack : Stack
end
