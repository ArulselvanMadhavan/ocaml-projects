include Tree_intf

module UnbalancedSet (O : Ordered) = struct
  type elem = O.t

  type tree = E | T of tree * elem * tree

  type set = tree

  let empty = E

  (* Takes 2d comparisons in worst case *)
  let rec member = function
    | _, E ->
        false
    | x, T (a, y, b) ->
        if O.lt (x, y) then member (x, a)
        else if O.lt (y, x) then member (x, b)
        else true

  let member_less_comparisons x s =
    let rec go = function
      | y, E ->
          if O.eq (x, y) then true else false
      | y, T (a, z, b) ->
          if O.lt (x, z) then go (z, a) else go (y, b)
    in
    go (x, s)

  let rec insert = function
    | x, E ->
        T (E, x, E)
    | x, T (a, y, b) ->
        if O.lt (x, y) then T (insert (x, a), y, b)
        else if O.lt (y, x) then T (a, y, insert (x, b))
        else T (a, y, b)
end
