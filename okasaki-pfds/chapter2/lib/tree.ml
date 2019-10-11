include Tree_intf

module UnbalancedSet (O : Ordered) : SetUsingTree with type elem = O.t = struct
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

  let rec insert = function
    | x, E ->
        T (E, x, E)
    | x, T (a, y, b) ->
        if O.lt (x, y) then T (insert (x, a), y, b)
        else if O.lt (y, x) then T (a, y, insert (x, b))
        else T (a, y, b)
end

module UnbalancedFiniteMap (O : Ordered) : FiniteMap = struct
  type key = O.t

  type 'a map = E | T of 'a map * key * 'a * 'a map

  let empty = E

  let rec lookup = function
    | _, E ->
      raise Not_found
    | k, T (a, x, y, b) ->
        if O.lt (k, x) then lookup (k, a)
        else if O.lt (x, k) then lookup (k, b)
        else y

  let rec bind = function
    | _, _, E ->
        E
    | k, v, T (a, x, _, b) ->
        if O.lt (k, x) then bind (k, v, a)
        else if O.lt (x, k) then bind (k, v, b)
        else T (a, k, v, b)
end
