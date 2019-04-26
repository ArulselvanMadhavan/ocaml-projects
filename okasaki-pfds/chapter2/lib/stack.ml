include Stack_intf
    
module List : Stack = struct
  type 'a t = 'a list

  let empty = []

  let isEmpty = function
    | [] -> true
    | _  -> false

  let cons (x, xs) = x :: xs

  let head = function
    | [] -> failwith "empty list"
    | (x :: _) -> x

  let tail = function
    | []  -> []
    |(_ :: xs) -> xs
end

module CustomStack : Stack = struct
  type 'a t = Nil
            | Cons of 'a * 'a t

  let empty = Nil

  let isEmpty = function
    | Nil -> true
    | _ -> false

  let cons (x, s) = Cons (x, s)

  let head = function
    | Nil -> failwith "Empty"
    | Cons(x, _) -> x

  let tail = function
    | Nil -> failwith "Empty"
    | Cons(_, xs) -> xs    
end
