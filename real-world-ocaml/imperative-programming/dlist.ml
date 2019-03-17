open Base

(* A node containing the value and pointers to the next and prev nodes in the linked list *)
type 'a element =
  { value : 'a;
    mutable next : 'a element option;
    mutable prev : 'a element option
  }

type 'a t = 'a element option ref

(* In the beginning there was none *)
let create () = ref None

let is_empty t = Option.is_none !t

let value elt = elt.value

let first t = !t

let next elt = elt.next

let prev elt = elt.prev

let insert_first t value =
  let new_elt = { prev = None; next = !t; value } in
  begin match !t with
    | Some old_first -> old_first.prev <- Some new_elt
    | None -> ()
  end;
  t := Some new_elt;
  new_elt

let insert_after elt value =
  let new_elt = { value; prev = Some elt; next = elt.next } in
  begin match elt.next with
    | Some old_next -> old_next.prev <- Some new_elt
    | None -> ()
  end;
  elt.next <- Some new_elt;
  new_elt

let remove t elt =
  let { prev; next; _ } = elt in
  begin match prev with
    | Some prev -> prev.next <- next
    | None -> ()
  end;
  begin match next with
    | Some next -> next.prev <- prev
    | None -> ()
  end;
  elt.next <- None;
  elt.prev <- None;
  
      
