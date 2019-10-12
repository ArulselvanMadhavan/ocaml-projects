include Heap_intf
    
module Leftist_Heap (O : Ordered) : Heap = struct
  module Elem = O

  (* int is for storing rank information *)
  type heap = E | T of int * Elem.t * heap * heap
  [@@deriving show, eq]
                       
  let empty = E

  let isEmpty = function E -> true | _ -> false

  let rank = function E -> 0 | T (r, _, _, _) -> r

  (** Maintains the leftist heap property by ensuring that the left subtree's rank is atleast as high as the right subtree *)
  let makeT (x, a, b) =
    if rank a >= rank b then T (rank b + 1, x, a, b)
    else T (rank a + 1, x, b, a)

  (** Runs in O(logn) *)
  let rec merge = function
    | E, h ->
        h
    | h, E ->
        h
    | (T (_, x, a1, b1) as h1), (T (_, y, a2, b2) as h2) ->
        if Elem.leq (x, y) then makeT (x, a1, merge (b1, h2))
        else makeT (y, a2, merge (h1, b2))

  let insert (x, h) = merge (T (1, x, E, E), h)

  let findMin = function
    | E -> None
    | (T (_, x, _, _)) -> Some x

  let deleteMin = function
    | E -> None
    | (T (_, _, a, b)) -> Some (merge (a, b))
end
