(* let e_01 arr = 
  let rec e_01' arr last =
      match arr with 
      | [] -> last
      | h::t -> e_01' t h
  in e_01' arr 0 *)

(* let e_02 arr =
  let rec e_02' arr p = 
    match arr with 
    | [] -> p
    | h1::h2::t -> e_02' t (Some h2, Some h1)
    | h::_ -> (match p with 
               | (None, None) -> (None, None)
               | (Some h1, None) -> (Some h1, Some h)
               | (None, Some h2) -> (Some h2, Some h)
               | (Some _, Some _) -> p)
  in e_02' arr (None, None) *)

(* let rec e_03 arr i = 
  match arr with
    | [] -> -1
    | h::_ when i = 0 -> h
    | _::t -> e_03 t (i-1) *)

(* let e_04 arr = 
  let rec e_04' arr i = 
    match arr with 
      | [] -> i 
      | _::t -> e_04' t (i+1)
  in e_04' arr 0 *)

(* let e_05 arr = 
  let rec e_05' arr rev = 
    match arr with 
      | [] -> rev
      | h::t -> e_05' t (h::rev)
  in e_05' arr [] *)

(* let e_06 arr = 
  let rev = List.rev arr in
  let rec e_06' arr rev = 
    match arr, rev with 
      | [], [] -> true
      | h1::t1, h2::t2 -> h1 = h2 && e_06' t1 t2
      | _ -> false
  in e_06' arr rev *)

(* type 'a node =
  | One of 'a 
  | Many of 'a node list

let e_07 arr = 
  let rec e_07' arr acc = 
    match arr with 
      | [] -> List.rev acc 
      | One h::t -> e_07' t (h::acc)
      | Many h::t -> e_07' (h@t) acc
  in e_07' arr [] *)