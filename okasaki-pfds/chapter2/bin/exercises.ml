open Chapter2.Stack

module List_Helpers (L : Stack with type 'a t = 'a list) = struct
  let rec ( ++ ) xs ys = match xs with [] -> ys | x :: xs -> x :: (xs ++ ys)

  let rec update = function
    | [], _, _ -> failwith "subscript"
    | _ :: xs, 0, y -> y :: xs
    | x :: xs, i, y -> x :: update (xs, i - 1, y)

  let rec suffixes = function [] -> [] | _ :: ys as xs -> xs :: suffixes ys
end

let () =
  let emptyList = List.empty in
  print_endline (string_of_bool (List.isEmpty emptyList))
