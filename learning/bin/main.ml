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

(* let e_08 arr = 
  let unwrap a = 
    match a with 
      | Some a -> a
      | None -> failwith "empty list" in
  let first arr =
    match arr with 
      | [] -> None
      | h::_ -> Some h in 
  let rec e_08' arr acc ignore = 
    match arr with 
      | [] -> List.rev acc
      | h::t when h = ignore -> e_08' t acc ignore
      | h::t -> e_08' t (h::acc) h 
  in let res = first arr |> unwrap
  in e_08' arr [res] res *)

(* let e_09 arr = 
  let rec e_091 arr i acc = 
    match arr with 
    | h::t when i = h -> e_091 t i (h::fst acc, t) 
    | [] -> acc
    | _::_ -> acc in 
  let rec e_092 arr acc = 
    match arr with 
    | [] -> List.rev acc
    | h::t -> 
      let (a, b) = e_091 arr h ([], t) in 
      e_092 b (a::acc)
  in e_092 arr [] *)
  (*   print_endline (String.concat "\n" (List.map (String.concat " ") res) *)

(* let e_10 arr = 
  let rec e_0101 arr i acc = 
    match arr with 
    | h::t when i = h -> e_0101 t i ((fst (fst acc) + 1, snd (fst acc)), t) 
    | [] -> acc
    | _::_ -> acc in 
  let rec e_0102 arr acc = 
    match arr with 
    | [] -> List.rev acc
    | h::t -> 
      let (a, b) = e_0101 arr h ((0, h), t) in 
      e_0102 b (a::acc)
  in e_0102 arr [] *)

  (*   Printf.printf "%s\n" (e_10 input |> List.map ( fun v -> let a, b = v in String.concat " x " [string_of_int a; b] ) |> String.concat "\n") *)

type 'a rle =
  | One of 'a
  | Many of int * 'a

let e_11 arr =
  let rec e_111 arr i acc = 
    match arr with 
    | h::t when i = h -> e_111 t i ((fst (fst acc) + 1, snd (fst acc)), t) 
    | [] -> acc
    | _::_ -> acc in 
  let rec e_112 arr acc = 
    match arr with 
    | [] -> List.rev acc
    | h::t -> 
      let (a, b) = e_111 arr h ((0, h), t) in 
      e_112 b (a::acc)
  in e_112 arr [] |> List.map (fun v -> let a, b = v in if a > 1 then Many (a, b) else One b)


