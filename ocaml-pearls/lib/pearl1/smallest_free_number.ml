
(* Assumes array will not be empty *)
let search xs =
  let rec take_while i =
    if xs.(i) then take_while (i + 1) else i
  in
  (take_while 0) + 1

let checklist xs =
  let n = List.length xs in
  let a = Array.make n false in
  let truelist = List.filter (fun i -> i <= n) xs in
  List.iter (fun x -> Array.set a (x-1) true) truelist;
  a

let minfree xs =
  search (checklist xs)

let (//) us _ =
  us
