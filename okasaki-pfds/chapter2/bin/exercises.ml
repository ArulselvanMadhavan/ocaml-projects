open Chapter2.Stack
open Chapter2.Tree

module List_Helpers (L : Stack with type 'a t = 'a list) = struct
  let rec ( ++ ) xs ys = match xs with [] -> ys | x :: xs -> x :: (xs ++ ys)

  let rec update = function
    | [], _, _ ->
        failwith "subscript"
    | _ :: xs, 0, y ->
        y :: xs
    | x :: xs, i, y ->
        x :: update (xs, i - 1, y)

  let rec suffixes = function [] -> [] | _ :: ys as xs -> xs :: suffixes ys
end

module Binary_Tree_Exercises (O : Ordered) = struct
  include UnbalancedSet (O)

  exception Element_exists

  (* Exercise 2.2 *)
  let member_less_comparisons x s =
    let rec go = function
      | y, E ->
          if O.eq (x, y) then true else false
      | y, T (a, z, b) ->
          if O.lt (x, z) then go (z, a) else go (y, b)
    in
    go (x, s)

  (* Exercise 2.3 and 2.4*)
  let insert_less_comparisons x s =
    let rec go = function
      | y, E ->
          if O.eq (x, y) then raise Element_exists else T (E, x, E)
      | y, T (a, z, b) ->
          if O.lt (x, z) then go (z, a) else go (y, b)
    in
    try go (x, s) with Element_exists -> s

  let rec complete = function
    | _, 0 ->
        E
    | x, d ->
        let sub_tree = complete (x, d - 1) in
        T (sub_tree, x, sub_tree)

  (* Structural  sharing *)

  (* Create a tree of size of m + 1 + m + 1 = 2(m+1) *)

  let rec create = function
    | _, 0 ->
        E
    | x, 1 ->
        T (E, x, E)
    | x, n ->
        Base.(
          if n % 2 = 0 then
            let ltree, rtree = create2 (x, (n - 1) / 2) in
            T (ltree, x, rtree)
          else
            let sub_tree = create (x, n / 2) in
            T (sub_tree, x, sub_tree))

  and create2 = function x, m -> (create (x, m), create (x, m + 1))
end

let () =
  let emptyList = List.empty in
  print_endline (string_of_bool (List.isEmpty emptyList))
