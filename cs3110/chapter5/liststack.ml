module type Stack = sig
  type 'a stack

  val empty : 'a stack

  val is_empty : 'a stack -> bool

  val push : 'a -> 'a stack -> 'a stack

  val peek : 'a stack -> 'a

  val pop : 'a stack -> 'a stack
end

module ListStack = struct
  type 'a stack = 'a list

  let empty = []

  let is_empty s = s = []

  let push x s = x :: s

  let peek = function [] -> failwith "Empty" | x :: _ -> x

  let pop = function [] -> failwith "Empty" | _ :: xs -> xs
end
