open Core
open Core_bench

(* type t1 = { mutable iters1: int; mutable count1: float}
 * type t2 = {iters2: int; count2: float}
 * 
 * let rec test_mutable t1 =
 *   match t1.iters1 with
 *   | 0 -> ()
 *   | _ ->
 *      t1.iters1 <- t1.iters1 - 1;
 *      t1.count1 <- t1.count1 +. 1.0; *)
                                
