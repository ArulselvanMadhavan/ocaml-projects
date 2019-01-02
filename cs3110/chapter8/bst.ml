type 'a tree = Node of 'a * 'a tree * 'a tree | Leaf

let rec mem x = function
  | Leaf -> false
  | Node (y, l, r) ->
    x = y || (x < y && mem x l) || mem x r

let rec insert x = function
  | Leaf -> Node(x, Leaf, Leaf)
  | Node (y, l, r) as t ->
    if x = y then t
    else if x < y then Node(y, insert x l, r)
    else Node (y, l, insert x r)
