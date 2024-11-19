# asin;;
- : float -> float = <fun>
# sqrt;;
- : float -> float = <fun>
# abs;;
- : int -> int = <fun>
# abs (-3);;
- : int = 3
# not true;;
- : bool = false
# not;;
- : bool -> bool = <fun>
# char_of_int 65;;
- : char = 'A'
# Char.code
  ;;
- : char -> int = <fun>
# String.length ("AB" ^ "CD");;
- : int = 4
# Stdlib.asin;;
- : float -> float = <fun>
# let pi = 2. *. asin 1.0;;
val pi : float = 3.14159265358979312
# 2. *. pi;;
- : float = 6.28318530717958623
# let f = function true -> false;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
false

(*-----------------------------------------------------------------*)
val f : bool -> bool = <fun>
# let all_true = function true -> true | false -> true;;
val all_true : bool -> bool = <fun>
# all_true(2/0 > 1);;
Exception: Division_by_zero.
# 2. /. 0.;;
- : float = infinity
# let all_true = function _ -> true;;
val all_true : 'a -> bool = <fun>
# all_true 0;;
- : bool = true
# all_true "hola";;
- : bool = true
# all_true not;;
- : bool = true
# all_true (not true);;
- : bool = true
# let all_true = function (_ : bool) -> true;;
val all_true : bool -> bool = <fun>
# all_true false;;
- : bool = true
# all_true true;;
- : bool = true
# all_true 2;;
Error: This expression has type int but an expression was expected of type
         bool
# let all_true : bool -> bool = function _ -> true;;
val all_true : bool -> bool = <fun>
# let is_zero = function 0 -> true | _ -> false;;
val is_zero : int -> bool = <fun>
# is_zero 0;;
- : bool = true
# is_zero "cero";;
Error: This expression has type string but an expression was expected of type
         int
# is_zero not;;
Error: This expression has type bool -> bool
       but an expression was expected of type int
# is_zero 9;;
- : bool = false
# let is_zero = function _ -> false | 0 -> true;;
Warning 11 [redundant-case]: this match case is unused.

(*-----------------------------------------------------------------*)
val is_zero : int -> bool = <fun>
# is_zero 9;;
- : bool = false
# is_zero 0;;
- : bool = false
# let doble = function x -> 2 * x;;
val doble : int -> int = <fun>
# doble 2;;
- : int = 4
# doble (-2);;
- : int = -4
# doble -2;;
Error: This expression has type int -> int
       but an expression was expected of type int
# doble (2 + 1);;
- : int = 6
# (function y -> 2 * y) (2 + 1);;
- : int = 6
# doble 2 + 1;;
- : int = 5
# doble (doble 3);;
- : int = 12
# doble doble 3;;
Error: The function doble has type int -> int
       It is applied to too many arguments
Line 1, characters 12-13:   This extra argument is not expected.
# (doble doble) 3;;
Error: This expression has type int -> int
       but an expression was expected of type int

(*-----------------------------------------------------------------*)
# let id = function x -> x;;
val id : 'a -> 'a = <fun>
# id (id "hola");;
- : string = "hola"
# id id "hola";;
- : string = "hola"
# let y = 10;;
val y : int = 10
# let x = 3;;
val x : int = 3
# let f = function x -> x * y;;
val f : int -> int = <fun>
# f(2 + 1);;
- : int = 30
# f x + f y;;
- : int = 130

(*-----------------------------------------------------------------*)
# let doble = function x -> 2 * x;;
val doble : int -> int = <fun>
# let doble x = 2 * x;;
val doble : int -> int = <fun>
# let id function x -> x;;
Error: Syntax error
# let id = function x -> x;;
val id : 'a -> 'a = <fun>
# let id x = x;;
val id : 'a -> 'a = <fun>
# let all_true _ = true;;
val all_true : 'a -> bool = <fun>
# let not = function true -> false | false -> true;;
val not : bool -> bool = <fun>
# let suma function x -> (function y -> x + y);;
Error: Syntax error
# let suma = function x -> (function y -> x + y);;
val suma : int -> int -> int = <fun>
# (suma 7)
  ;;
- : int -> int = <fun>
# (suma 7) 2;;
- : int = 9
# ler s7 = suma 7;;
Error: Unbound value ler
Hint: Did you mean lor or lsr?
# let s7 = suma 7;;
val s7 : int -> int = <fun>
# s7 2;;
- : int = 9
# suma 7 2;;
- : int = 9
# suma;;
- : int -> int -> int = <fun>
# suma 3 (-1);;
- : int = 2
# let pred = (-) 1;;
val pred : int -> int = <fun>
# pred 8;;
- : int = -7
# let pred = (+) (-1);;
val pred : int -> int = <fun>
# pred 8;;
- : int = 7
# let op = (*) (-1);;
Warning 1 [comment-start]: this `(**)' is the start of a comment.
(*Hint: Did you forget spaces when writing the infix operator `( *)'?*)
* op 5;;

(*-----------------------------------------------------------------*)
# let op = ( * ) (-1);;
val op : int -> int = <fun>
# op 6;;
- : int = -6
# let op = (-) 0;;
val op : int -> int = <fun>
# op 6;;
- : int = -6
# (/);;
- : int -> int -> int = <fun>
# (mod);;
- : int -> int -> int = <fun>
# (&&);;
- : bool -> bool -> bool = <fun>
# (<);;
- : 'a -> 'a -> bool = <fun>
# (=);;
- : 'a -> 'a -> bool = <fun>
# (<>);;
- : 'a -> 'a -> bool = <fun>
# max;;
- : 'a -> 'a -> 'a = <fun>
# mx 14;;
Error: Unbound value mx
# max 14;;
- : int -> int = <fun>
# max 14 9;;
- : int = 14
# max 'z' 'a';;
- : char = 'z'
# max 'A' 'a';;
- : char = 'a'
# min 4 2;;
- : int = 2
# min "hola" "adios";;
- : string = "adios"
# 2,3;;
- : int * int = (2, 3)
#Interrupted.
# 3,not true,"algo";;
- : int * bool * string = (3, false, "algo")
# let suma2 = function (x,y) -> x + y;;
val suma2 : int * int -> int = <fun>
# suma 2,3;;
Error: Unbound value suma
Hint: Did you mean suma2?
# suma2 2,3;;
Error: This expression has type int but an expression was expected of type
         int * int
# suma2 (2,3);;
- : int = 5
# (function (x,y) -> x + y) (7,2);;
- : int = 9
# let x,y = 7,2 in x+y;;
- : int = 9
# let x, y = 6 + 1, 2 * 4;;
val x : int = 7
val y : int = 8
# let x, y = 2 +1;;
Error: This expression has type int but an expression was expected of type
         'a * 'b
         
(*-----------------------------------------------------------------*)
# let fst = function x,y -> x;;
val fst : 'a * 'b -> 'a = <fun>
# fst 2,3;;
Error: This expression has type int but an expression was expected of type
         'a * 'b
# fst (2,3);;
- : int = 2
# let fact if n = 0 then 1 else n * fact(n-1);;
Error: Syntax error
# let fact = function if n = 0 then 1 else n * fact(n-1);;
Error: Syntax error
# let fact = function (if n = 0 then 1 else n * fact(n-1));;
Error: Syntax error: operator expected.
# let rec fact n = if n = 0 then 1 else n * fact(n-1);;
val fact : int -> int = <fun>
# fact 2
  ;;
- : int = 2
# fact 10;;
- : int = 3628800
# fact 20;;
- : int = 2432902008176640000
# fact 30;;
- : int = 458793068007522304
# fact 100;;
- : int = 0
# fact 64;;
- : int = 0
# fact 63;;
- : int = 1585267068834414592

(*-----------------------------------------------------------------*)
# let f (x,y) = x + y, x * y;;
val f : int * int -> int * int = <fun>
# f(3,5);;
- : int * int = (8, 15)
# let f x y = x + y, x * y;;
val f : int -> int -> int * int = <fun>
# let f x = function x -> (function y -> x + y,  x * y);;
val f : 'a -> int -> int -> int * int = <fun>
# let f = function x -> (function y -> x + y,  x * y);;
val f : int -> int -> int * int = <fun>
# let f x = function y -> x + y, x * y;;
val f : int -> int -> int * int = <fun>
# let per_area x =
      let pi = 2. *. asin 1. in
      2. *. pi *. x, pi *. x *. x;;
val per_area : float -> float * float = <fun>
# per_area 1.;;
- : float * float = (6.28318530717958623, 3.14159265358979312)

(*-----------------------------------------------------------------*)
# let rec fib n = ( * n >= 1 * )
  if n =< 2 then 1
  else fib (n-1) + (n-2);;;;
Error: Syntax error: ) expected
Line 1, characters 16-17:   This ( might be unmatched
# let rec fib n = (* n >= 1 *)
  if n =< 2 then 1
  else fib (n-1) + (n-2);;
Error: Unbound value (=<)
# let rec fib n = (* n >= 1 *)
  if n <= 2 then 1
  else fib (n-1) + (n-2);;
val fib : int -> int = <fun>
# fib 1
  ;;
- : int = 1
# fib 2;;
- : int = 1
# fib 3;;
- : int = 2
# fib 30;;
- : int = 407
# fib 40;;
- : int = 742
# let rec fib n = (* n >= 1 *)
  if n <= 2 then 1
  else fib (n-1) * (n-2);;
val fib : int -> int = <fun>
# fib 3;;
- : int = 1
# let rec fib n = (* n >= 1 *)
  if n <= 2 then 1
  else fib n*(n-1) * (n-2);;
val fib : int -> int = <fun>
# fib 3;;
Stack overflow during evaluation (looping recursion?).
# let rec fib n = (* n >= 1 *)
  else fib n*(n-1) * (n-2);;
Error: Syntax error
# let rec fib n = (* n >= 1 *)
  if n <= 2 then 1
  else fib n * (n-1);;
val fib : int -> int = <fun>
# fib 3;;
Stack overflow during evaluation (looping recursion?).
# let rec fib n = (* n >= 1 *)
    if n <= 2 then 1
    elsn + fib(n-1);;
Error: This expression has type int
       This is not a function; it cannot be applied.
# let rec fib n = (* n >= 1 *)
    if   n <= 2 then 1
      else n + fib(n-1);;
val fib : int -> int = <fun>
# fib 3;;
- : int = 4
#
  fib 30;;
- : int = 463
# let rec fib n = ( * n >= 1 * )
    if n =< 2 then 1
    else fib (n+ fib (n-2);;;;
Error: Syntax error: ) expected
Line 1, characters 16-17:   This ( might be unmatched
#
  let rec fib n = ( * n >= 1 * )
    if n =< 2 then 1
    else fib (n-1) + fib (n-2);;
Error: Syntax error: ) expected
Line 2, characters 16-17:   This ( might be unmatched
# let rec fib n = (* n >= 1 *)
    if n =< 2 then 1
    else fib (n-1) + fib (n-2);;
Error: Unbound value (=<)
# let rec fib n = (* n >= 1 *)
    if n <= 2 then 1
    else fib (n-1) + fib (n-2);;
val fib : int -> int = <fun>
# fib 3;;
- : int = 2
# fib 30;;
- : int = 832040
# fib 40;;
- : int = 102334155
# fib 4;;
- : int = 3
# fib 5;;
- : int = 5
# fib 40;;
- : int = 102334155
# fib 40;;
- : int = 102334155
# (*tarda sobre 1.8 seg*)
  ;;
# fib 46;;
- : int = 1836311903
# (*tarda sobre 27 segundos*);;
# (*tarda porque tiene una complejidad exponencial*);;
# let crono f x =
      let t = Sys.time () in
    le  t _ = f x in
      Sys.time () -. t;;
Error: Syntax error
# let crono f x =
    let t _ = f x in
  ;;
Error: Syntax error
# let crono f x =
      let t = Sys.time () in
    let t _ = f x in
      Sys.time () -. t;;
Error: This expression has type 'a -> 'b
       but an expression was expected of type float
# let crono f x =
      let t = Sys.time () in
    let _ = f x in
      Sys.time () -. t;;
val crono : ('a -> 'b) -> 'a -> float = <fun>
# crono fib 40;;
- : float = 1.56481499999999585
# crono fib 46;;
- : float = 27.3860570000000081
# crono fib 40;;
- : float = 1.57302500000000123
# let rec fib2 n =
      if n = 1 then 1, 0
      else let fa, faa = fib2 (n-1)
          in fa + faa, fa;;
val fib2 : int -> int * int = <fun>
# fib2 40;;
- : int * int = (102334155, 63245986)
# crono fib2 40;;
- : float = 8.99999999859346644e-06
# crono fib2 60;;
- : float = 1.20000000052300493e-05
# crono fib2 90;;
- : float = 1.10000000006493792e-05
# let fastfib n = fst (fib2 n);;
val fastfib : int -> int = <fun>
# fastbib 90;;
Error: Unbound value fastbib
Hint: Did you mean fastfib?
# fastfib 90;;
- : int = 2880067194370816120
# crono fastfib 1_000;;
- : float = 5.79999999956726242e-05
# crono fastfib 300_000;;
- : float = 0.0300090000000068358
# crono fastfib 500_000;;
- : float = 0.0451759999999978845

(*-----------------------------------------------------------------*)

# let fib n =
  let rec aux (i, u, p) =
      if i = n then u
      else aux (i+1, u+p, u)
  in aux (1, 1, 0);;
val fib : int -> int = <fun>
# [1; 2; 3; 10];;
- : int list = [1; 2; 3; 10]
# [1; -2; 0];;
- : int list = [1; -2; 0]
# let p = (7, "dos");;
val p : int * string = (7, "dos")
# 1 + fst p;;
- : int = 8
# snd p;;
- : string = "dos"
# let n, s = p;;
val n : int = 7
val s : string = "dos"
# ['a'; 'e'; 'u'];;
- : char list = ['a'; 'e'; 'u']
# [];;
- : 'a list = []
# [(); (); ()];;
- : unit list = [(); (); ()]
# 3;;
- : int = 3
# [3];;
- : int list = [3]
# let l = [1; 2; 3; 10];;
val l : int list = [1; 2; 3; 10]
# List.hd l;;
- : int = 1
# List.hd ['a];;
Error: Syntax error
# List.hd ['a'];;
- : char = 'a'
# List.hd [];;
Exception: Failure "hd".
# List.tl l;;
- : int list = [2; 3; 10]
# List.tl [];;
Exception: Failure "tl".
# List.tl ["hola"];;
- : string list = []
# let rec length l =
  if List.tl l = [] then 1
  else 1 + length (List.tl l);;
val length : 'a list -> int = <fun>
# length [1;2];;
- : int = 2
# length [];;
Exception: Failure "tl".
# let rec length l =
  if l = [] then 0
  else 1 + length (List.tl l);;
val length : 'a list -> int = <fun>
# length [1;2];;
- : int = 2
# length [];;
- : int = 0

(*-----------------------------------------------------------------*)

# let rec length l =
  if l =   [] then 0
  else   1 + length (List.tl l);;
val length : 'a list -> int = <fun>
# let length l =
      let rec loop (i, l) =
          if l = [] then i
          else loop(i+1, List.tl l)
      in loop (0, l);;
val length : 'a list -> int = <fun>
# 1 :: (2 :: (3 :: []));;
- : int list = [1; 2; 3]
# let h = 1;;
val h : int = 1
# let t = [2; 3];;
val t : int list = [2; 3]
# let l = [];;
val l : 'a list = []
# let h::t = l;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]

Exception: Match_failure ("//toplevel//", 1, 4).
# let hd = function
      h::_ -> h;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]

val hd : 'a list -> 'a = <fun>
# let hd (h::_) = h;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]

val hd : 'a list -> 'a = <fun>
# let tl (_::t) = t;;
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]

val tl : 'a list -> 'a list = <fun>
# let rec length = function
      [] -> 0
    | _::t -> 1 +length t;;
val length : 'a list -> int = <fun>

(*-----------------------------------------------------------------*)

# List.fold_left;;
- : ('acc -> 'a -> 'acc) -> 'acc -> 'a list -> 'acc = <fun>
# let sumlist = List.fold_left (+) 0;;
val sumlist : int list -> int = <fun>
# sumlist [1;2;3];;
- : int = 6
# sumlist (List.init 3_000_000 succ);;
- : int = 4500001500000
# let lmax = function
  ;;
Error: Syntax error
# Random.int 3;;
- : int = 0
# Random.int 3;;
- : int = 1
# Random.int 3;;
- : int = 0
# Random.int 3;;
- : int = 1
# Random.int 3;;
- : int = 0
# Random.int 3;;
- : int = 0
# Random.int 3;;
- : int = 0
# Random.int 3;;
- : int = 2
# Random.int 3;;
- : int = 2
# let length l = List.fold_left (fun a _ -> a + 1) 0 1;;
Error: This expression has type int but an expression was expected of type
         'a list
# let ?length l = List.fold_left (fun a _ -> a + 1) 0 1;;
Error: Syntax error
# let length l = List.fold_left (fun a _ -> a + 1) 0 1;;
Error: This expression has type int but an expression was expected of type
         'a list
# List.for_all;;
- : ('a -> bool) -> 'a list -> bool = <fun>
# let last = function
      [] -> raise (Failure "last")
    | h::t -> List.fold_left (fun _ e -> e) h t;;
val last : 'a list -> 'a = <fun>
# last (List.init 50 (fun i -> char_of_int (45 + i)));;
- : char = '^'
# let for_all p l =
      List.fold_left (fun acc e -> acc && p e) true l;;
val for_all : ('a -> bool) -> 'a list -> bool = <fun>
# for_all (fun n-> n mod 2 = 0) [2;4;8];;
- : bool = true
# for_all (fun n-> n mod 2 = 0) [2;3;8];;
- : bool = false

(*-----------------------------------------------------------------*)

# let rec ordenada = function
      [] | _::[] -> true
   | h1::h2::t -> h1 <= h2 && ordenada(h2::t);;
val ordenada : 'a list -> bool = <fun>
# ordenada [4;1;3];;
- : bool = false
# ordenada [1;2;3];;
- : bool = true
# let rec insert x = function
      [] -> [x]
    | h::t -> if x < h then x::h::t
          else h::insert x t;;
val insert : 'a -> 'a list -> 'a list = <fun>
# insert 2;;
- : int list -> int list = <fun>
# insert [1;2;3] 4;;
Error: This expression has type int but an expression was expected of type
         int list list
# insert 4 [1;2;3];;
- : int list = [1; 2; 3; 4]
# insert 1 [1;2;3];;
- : int list = [1; 1; 2; 3]
# let rec i_sort = function
      [] -> []
    | h::t -> insert h (i_sort t);;
val i_sort : 'a list -> 'a list = <fun>
# i_sort 4 [1;2;3;4;5];;
Error: The function i_sort has type 'a list -> 'a list
       It is applied to too many arguments
Line 1, characters 9-20:   This extra argument is not expected.
# i_sort [1;0;-1;2;9];;
- : int list = [-1; 0; 1; 2; 9]
# i_sort (List.rev (List.init 20_000 succ))
 (*Aplicación is_sort para su peor caso*);;
- : int list =
[1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21;
 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38; 39; 40;
 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52; 53; 54; 55; 56; 57; 58; 59;
 60; 61; 62; 63; 64; 65; 66; 67; 68; 69; 70; 71; 72; 73; 74; 75; 76; 77; 78;
 79; 80; 81; 82; 83; 84; 85; 86; 87; 88; 89; 90; 91; 92; 93; 94; 95; 96; 97;
 98; 99; 100; 101; 102; 103; 104; 105; 106; 107; 108; 109; 110; 111; 112;
 113; 114; 115; 116; 117; 118; 119; 120; 121; 122; 123; 124; 125; 126; 127;
 128; 129; 130; 131; 132; 133; 134; 135; 136; 137; 138; 139; 140; 141; 142;
 143; 144; 145; 146; 147; 148; 149; 150; 151; 152; 153; 154; 155; 156; 157;
 158; 159; 160; 161; 162; 163; 164; 165; 166; 167; 168; 169; 170; 171; 172;
 173; 174; 175; 176; 177; 178; 179; 180; 181; 182; 183; 184; 185; 186; 187;
 188; 189; 190; 191; 192; 193; 194; 195; 196; 197; 198; 199; 200; 201; 202;
 203; 204; 205; 206; 207; 208; 209; 210; 211; 212; 213; 214; 215; 216; 217;
 218; 219; 220; 221; 222; 223; 224; 225; 226; 227; 228; 229; 230; 231; 232;
 233; 234; 235; 236; 237; 238; 239; 240; 241; 242; 243; 244; 245; 246; 247;
 248; 249; 250; 251; 252; 253; 254; 255; 256; 257; 258; 259; 260; 261; 262;
 263; 264; 265; 266; 267; 268; 269; 270; 271; 272; 273; 274; 275; 276; 277;
 278; 279; 280; 281; 282; 283; 284; 285; 286; 287; 288; 289; 290; 291; 292;
 293; 294; 295; 296; 297; 298; 299; ...]
# let crono f c = let t = Sys.time () in let _ = f x in Sys.time () -. t;;
Error: Unbound value x
#let crono f x = let t = Sys.time () in let _ = f x in Sys.time () -. t;;
val crono : ('a -> 'b) -> 'a -> float = <fun>
# crono i_sort (List.rev (List.init 10_000 succ));;
- : float = 1.23573299999999975
# crono i_sort (List.rev (List.init 40_000 succ));;
- : float = 31.3513329999999968
# 5. ** 4.;;
- : float = 625.
# crono i_sort (List.init 20_000 (fun _ -> Random.int 200_000));;
- : float = 2.73980300000000199
# crono i_sort (List.init 180_000 succ);;
- : float = 0.0381529999999941083
# crono i_sort (List.init 300_000 succ);;
- : float = 0.0571350000000023783

(*-----------------------------------------------------------------*)

# let rec insert x = function
      [] -> [x]
   |  h::t -> if x <= h then x::h::t
          else h::insert x t;;
val insert : 'a -> 'a list -> 'a list = <fun>
# let rec isort = function
      [] -> []
    | h::t -> insert h (isort t);;
val isort : 'a list -> 'a list = <fun>
# let crono f x =
      let t = Sys.time () in
      let _ = f x in
      Sys.time () -. t;;
val crono : ('a -> 'b) -> 'a -> float = <fun>
# let rec merge = function
      ([], l) | (l, []) ->
    | (h1::t1, h2::t2) -> if h1 <= h2
                          then h1 :: merge (t1, h2::t2)
                          then h2 :: merge (h1::t1, t2);;
Error: Syntax error
# let rec merge = function
      ([], l) | (l, []) -> l
    | (h1::t1, h2::t2) -> if h1 <= h2
                          then h1 :: merge (t1, h2::t2)
                          then h2 :: merge (h1::t1, t2);;
Error: Syntax error
# let rec merge = function
      ([], l) | (l, []) -> l
    | (h1::t1, h2::t2) -> if h1 <= h2
                          then h1 :: merge (t1, h2::t2)
                          else h2 :: merge (h1::t1, t2);;
val merge : 'a list * 'a list -> 'a list = <fun>
# let rec divide = function
      (h1::h2::t) -> let t1, t2 = divide t in
                     (h1::t1, h2::t2)
   | l -> l,[];;
val divide : 'a list -> 'a list * 'a list = <fun>
# divide [1;3;8];;
- : int list * int list = ([1; 8], [3])
# let m_sort l =
      let l1, l2 = divide l in
      merge (m_sort l1, m_sort l2);;
Error: Unbound value m_sort
Hint: Did you mean isort?
Hint: If this is a recursive definition,
you should add the rec keyword on line 1
# let rec m_sort l =
      let l1, l2 = divide l in
      merge (m_sort l1, m_sort l2);;
val m_sort : 'a list -> 'b list = <fun>
# m_sort [1;3;2];;
Stack overflow during evaluation (looping recursion?).
# let rec m_sort l = match l with
      [] | _::[] -> l
    | _ -> let l1, l2 = divide l in
           merge (m_sort l1, m_sort l2);;
val m_sort : 'a list -> 'a list = <fun>

(*-----------------------------------------------------------------*)

# let rlist r n = List.init n (fun _ -> Random.int r);;
val rlist : int -> int -> int list = <fun>
# let r20 = rlist 1_000_000 20_000;;
val r20 : int list =
  [769754; 553262; 373510; 584865; 616996; 111861; 737495; 655037; 874283;
   395434; 162098; 958495; 725144; 765034; 806; 3028; 53180; 214058; 672416;
   84138; 612654; 599649; 738946; 342876; 68887; 318794; 447764; 504342;
   800572; 600136; 963177; 808855; 73717; 922837; 778746; 481130; 825287;
   864420; 292232; 636216; 983911; 793467; 728247; 322728; 172927; 738202;
   122103; 814194; 332398; 972104; 82290; 973747; 180788; 787757; 627554;
   496817; 765151; 254077; 512207; 84621; 781961; 385736; 56743; 623952;
   722621; 18097; 305855; 222643; 275479; 185733; 393443; 544139; 697774;
   721655; 763226; 422977; 521913; 600990; 164073; 801484; 208513; 903564;
   112666; 702849; 249579; 92561; 78381; 872441; 913593; 428476; 308497;
   732275; 5567; 348647; 378206; 14707; 808528; 980117; 977975; 87999; 38025;
   73484; 766783; 754241; 134752; 716180; 110777; 46332; 643271; 572337;
   726704; 828399; 466239; 85369; 340377; 449114; 383878; 465247; 10286;
   273052; 160408; 429277; 433901; 161247; 247738; 289793; 20781; 644845;
   279563; 974912; 247899; 776330; 24766; 538220; 94832; 730351; 719169;
   858538; 654065; 129735; 532303; 624829; 716426; 281232; 865877; 841147;
   710857; 109620; 874909; 826175; 177519; 244110; 297204; 424558; 924821;
   901015; 113804; 163262; 76144; 859825; 354324; 468192; 326897; 408220;
   31160; 961157; 238554; 41964; 222802; 585492; 599929; 430453; 973085;
   363199; 433235; 253139; 137410; 550723; 803086; 893211; 687429; 344269;
   934162; 193678; 572642; 348252; 726581; 299189; 895562; 787006; 274447;
   904883; 173623; 337835; 245593; 364311; 957530; 563126; 35468; 722862;
   600967; 634029; 898631; 749231; 464055; 717613; 292336; 566369; 593104;
   518907; 798998; 380040; 131870; 647955; 699701; 22821; 124056; 914732;
   33534; 750407; 820803; 676149; 92330; 512324; 118100; 185038; 795345;
   73504; 667217; 392567; 850990; 518859; 745722; 371200; 711475; 913159;
   599660; 32456; 430586; 335446; 99054; 413562; 159822; 87952; 788924;
   290927; 24642; 311163; 857599; 843521; 667342; 718713; 23544; 794834;
   925523; 994304; 251933; 403874; 118293; 170091; 964496; 985005; 355371;
   99031; 36485; 846339; 322260; 440177; 732521; 161828; 383493; 313481;
   261886; 750336; 109938; 431603; 307780; 822415; 495102; 549696; 863460;
   74669; 773565; 935653; 583207; 971664; 761839; 103855; 8484; 741111;
   732363; 324193; 278000; 903275; 153851; 81378; 571974; 282472; 189254;
   ...]
# let r160 = rlist 1_000_000 160_000;;
val r160 : int list =
  [471458; 95269; 112301; 387204; 933335; 639941; 251365; 397422; 83956;
   692829; 188261; 870875; 789165; 335222; 661373; 665798; 707787; 548339;
   91689; 576597; 459343; 540145; 268806; 733371; 152512; 342641; 251761;
   501211; 321715; 678184; 695046; 470216; 933961; 64128; 883059; 934434;
   178166; 414209; 970027; 798854; 260022; 603671; 933838; 394063; 239234;
   615200; 465206; 353131; 740114; 597194; 33868; 175916; 674004; 828396;
   439258; 781004; 854679; 56131; 890469; 810465; 882616; 427704; 3412;
   404006; 498462; 716924; 251697; 560752; 504211; 882491; 622085; 936338;
   625567; 452067; 303221; 909551; 851335; 143694; 933518; 860885; 734092;
   72681; 129834; 807839; 125121; 514897; 752794; 380904; 918253; 450529;
   860168; 216057; 810908; 612106; 929197; 483365; 226905; 947751; 639841;
   674533; 881045; 933227; 307983; 446153; 941489; 506736; 838877; 241957;
   826288; 243247; 806892; 409603; 320934; 596859; 809067; 525116; 877742;
   681363; 162081; 794076; 182353; 49109; 831735; 457776; 995149; 185032;
   536062; 353684; 491187; 707054; 371148; 478049; 625043; 743368; 687979;
   480156; 278038; 677367; 391334; 507712; 701710; 686832; 823602; 41179;
   84807; 29483; 178249; 249576; 835062; 941217; 284272; 774504; 63047;
   709860; 990791; 107899; 914893; 12285; 796047; 835084; 49806; 47960;
   579374; 606097; 567725; 241971; 94119; 135613; 309140; 535301; 559054;
   703784; 59465; 889445; 800272; 59469; 624749; 934901; 217646; 683968;
   181349; 434227; 442645; 75308; 395306; 521986; 468947; 700044; 570406;
   666408; 571015; 114425; 288701; 526951; 746093; 776063; 467059; 252349;
   572973; 893206; 156786; 11677; 671701; 460533; 989343; 148241; 815822;
   848727; 935148; 299479; 449012; 589151; 863722; 220782; 17016; 382104;
   525749; 723531; 97684; 736569; 815547; 255408; 589716; 339959; 444735;
   747862; 524249; 133335; 958444; 740597; 268659; 232820; 557293; 430502;
   583075; 643185; 744124; 107987; 44640; 143388; 934099; 199644; 491564;
   899738; 343536; 988881; 85255; 971373; 515194; 189420; 19089; 18280;
   594105; 336959; 592636; 649833; 732149; 881271; 873509; 431393; 878417;
   381012; 786127; 215589; 741260; 937410; 435699; 682995; 831050; 27926;
   26598; 335515; 201802; 879897; 156651; 773513; 442159; 333729; 893711;
   556876; 410312; 48904; 29993; 305447; 52233; 847118; 700304; 926832;
   362774; 687946; 585694; 101619; 112156; 654136; 232681; 631528; 954889;
   733916; 652480; ...]
# let r320 = rlist 1_000_000 320_000;;
val r320 : int list =
  [993661; 864987; 870488; 126356; 752772; 448086; 942965; 256443; 473024;
   320823; 667601; 860956; 72955; 985993; 937680; 442878; 164010; 829882;
   802968; 110664; 427041; 603779; 353132; 180476; 972942; 818809; 338030;
   808817; 219048; 572445; 950140; 654465; 717968; 67089; 561606; 831987;
   693272; 291328; 929340; 789748; 850028; 289712; 689635; 12184; 723733;
   262525; 254423; 113143; 979553; 65183; 554197; 749859; 257116; 839232;
   92625; 518242; 78339; 742892; 409188; 295734; 926308; 738784; 971891;
   292594; 597578; 590173; 781391; 851014; 671845; 392548; 368078; 533590;
   244348; 508458; 279837; 911722; 579254; 593052; 560534; 345857; 531751;
   726458; 318842; 540053; 879380; 147245; 865237; 131179; 165715; 435007;
   775241; 28904; 724453; 761318; 974186; 822226; 483608; 375018; 929502;
   411632; 919509; 944055; 616501; 117747; 407267; 420382; 741272; 562204;
   561793; 865218; 640557; 296383; 230073; 7943; 76948; 95213; 761606;
   883053; 931365; 609349; 332040; 314517; 63169; 24543; 451635; 657535;
   442141; 461761; 900499; 720363; 82742; 823194; 618657; 424129; 667981;
   721499; 208508; 697235; 782781; 556860; 954913; 550673; 945427; 514860;
   849658; 132058; 978105; 940895; 346788; 68813; 320399; 698859; 916996;
   522777; 236195; 936328; 764197; 349264; 417149; 460251; 554333; 528132;
   304421; 70685; 637832; 858719; 99262; 270310; 486055; 326532; 824349;
   121593; 636906; 193630; 141793; 995981; 101772; 569133; 999052; 501010;
   270404; 77842; 785786; 616358; 687450; 933744; 670840; 269930; 335020;
   45930; 995397; 735438; 473584; 981028; 958870; 454897; 320543; 61648;
   92798; 925783; 509771; 590075; 800076; 153708; 56996; 561613; 762104;
   919681; 108065; 631745; 287971; 534944; 372047; 31537; 541125; 666392;
   673124; 687475; 270553; 157774; 83241; 997926; 722597; 179333; 888649;
   34545; 540911; 211902; 895998; 366466; 424507; 278377; 524343; 854820;
   955267; 405574; 222810; 490291; 352908; 967643; 760120; 853716; 524078;
   448766; 117320; 609418; 597657; 333562; 904218; 996149; 17709; 419350;
   197516; 945038; 7607; 227331; 323912; 528967; 103581; 139017; 405226;
   373831; 900533; 867951; 768040; 488320; 85916; 843996; 411254; 546972;
   917503; 895892; 823001; 139660; 96424; 476459; 703451; 240585; 617969;
   345451; 31959; 720285; 430067; 215191; 471102; 631360; 52562; 299456;
   958229; 741721; 343286; 439869; 432553; 806542; 58730; 535967; 692302;
   753048; 624517; ...]
# let rec insert x = function
        [] -> [x]
   |    h::t -> if x <= h then x::h::t
            else h::insert x t;;
val insert : 'a -> 'a list -> 'a list = <fun>
# let rec isort = function
      [] -> []
        | h::t -> insert h (isort t);;
val isort : 'a list -> 'a list = <fun>
# let crono f x =
      l  et t = Sys.time () in
        let _ = f x in
        Sys.time () -. t;;
val crono : ('a -> 'b) -> 'a -> float = <fun>
# let rec merge = function
        ([], l) | (l, []) -> l
    |   (h1::t1, h2::t2) -> if h1 <= h2
                            then h1 :: merge (t1, h2::t2)
                            else h2 :: merge (h1::t1, t2);;
val merge : 'a list * 'a list -> 'a list = <fun>
# let rec divide = function
      (h(h1::h2::t) -> let t1, t2 = divide t in
                       (h1::t1, h2::t2)
   | l   -> l,[];;
val divide : 'a list -> 'a list * 'a list = <fun>
# let rec m_sort l = match l with
        [] | _::[] -> l
      | _ -> let l1, l2 = divide l in
           merge   (m_sort l1, m_sort l2);;
val m_sort : 'a list -> 'a list = <fun>
# crono m_sort r160;;
- : float = 0.292603000000000057
# let divide' l = (* tail recursive *)
      let rec loop l1 l2 = function
          h1::h2::t -> loop (h1::l1) (h2::l2) t
        | [h] -> (h::l1), l2
        | [] -> l1,l2
      in loop [] [] l;;
val divide' : 'a list -> 'a list * 'a list = <fun>
# divide' ['a'; 'e'; 'i'; 'o'; 'u'];;
- : char list * char list = (['u'; 'i'; 'a'], ['o'; 'e'])

(*-----------------------------------------------------------------*)

# let hd' l =
      try List.hd l with
          Failure "tl" -> [];;
Warning 52 [fragile-literal-pattern]: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (see manual section 13.5.3)

val hd' : 'a list list -> 'a list = <fun>
# List.hd [];;
Exception: Failure "hd".
# hd' [1;2;3];;
Error: This expression has type int but an expression was expected of type
         'a list
# let tl' l =
      try List.tl l with
          Failure _ -> [];;
val tl' : 'a list -> 'a list = <fun>
# tl' [1;2;3];;
- : int list = [2; 3]
# tl' [];;
- : 'a list = []

(*-----------------------------------------------------------------*)

# let come (i1,j1) (i2,j2) =
    i1 = i  2 || j1 = j2 || abs (i1-i2) = abs (j1-j2);;
val come : int * int -> int * int -> bool = <fun>
# let compatible q l =
      not (List.exist (come q) l);;
Error: Unbound value List.exist
Hint: Did you mean exists?
# let compatible q l =
      not (List.exists (come q) l);;
val compatible : int * int -> (int * int) list -> bool = <fun>
# let reinas n =
      let rec completar camino i j =
          if i > n then camino
          else if j > n then raise Not_found
          else if compatible (i, j) camino
                  then try completar ((i,j)::camino)(i+1) 1
                       with completar camino i (j+1)
                else completar camino i (j+1)
      in completar [] 1 1;;
Error: Syntax error
# let reinas n =
    le  t rec completar camino i j =
          if i > n then camino
          else if j > n then raise Not_found
          else if compatible (i, j) camino
                  then try completar ((i,j)::camino)(i+1) 1
                       with Not_found -> completar camino i (j+1)
                else completar camino i (j+1)
    in   completar [] 1 1;;
val reinas : int -> (int * int) list = <fun>
# reinas 0;;
- : (int * int) list = []
# reinas 1;;
- : (int * int) list = [(1, 1)]
# reinas 2;;
Exception: Not_found.
# reinas 3;;
Exception: Not_found.
# reinas 4;;
- : (int * int) list = [(4, 3); (3, 1); (2, 4); (1, 2)]
# reinas 8;;
- : (int * int) list =
[(8, 4); (7, 2); (6, 7); (5, 3); (4, 6); (3, 8); (2, 5); (1, 1)]
# reinas 128;;
Interrupted.
# reinas 30;;
Interrupted.
# reinas 20;;
- : (int * int) list =
[(20, 11); (19, 6); (18, 14); (17, 7); (16, 10); (15, 8); (14, 19); (13, 16);
 (12, 9); (11, 17); (10, 20); (9, 18); (8, 12); (7, 15); (6, 13); (5, 4);
 (4, 2); (3, 5); (2, 3); (1, 1)]
# let reinas n =
      let rec completar camino i j =
          if i > n then Some camino
          else if j > n then None
          else if compatible (i, j) camino
                  then match completar ((i,j)::camino)(i+1) 1
                       with None -> completar camino i (j+1)
                          | Some sol -> Some sol
                else completar camino i (j+1)
    in   completar [] 1 1;;
val reinas : int -> (int * int) list option = <fun>
# reinas 0;;
- : (int * int) list option = Some []
# reinas 1;;
- : (int * int) list option = Some [(1, 1)]
# reinas 2;;
- : (int * int) list option = None
# reinas 4;;
- : (int * int) list option = Some [(4, 3); (3, 1); (2, 4); (1, 2)]
# reinas 23;;
- : (int * int) list option =
Some
 [(23, 14); (22, 17); (21, 15); (20, 12); (19, 16); (18, 7); (17, 23);
  (16, 6); (15, 8); (14, 10); (13, 21); (12, 19); (11, 22); (10, 20);
  (9, 18); (8, 13); (7, 11); (6, 9); (5, 4); (4, 2); (3, 5); (2, 3);
  (1, 1)]
# let all_reinas n =
      let rec completar camino i j =
          if i > n then [camino]
          else if j > n then []
          else if compatible (i, j) camino
                  then completar ((i,j)::camino) (i+1) 1 @
                       completar camino i (j+1)
                else completar camino i (j+1)
    in   completar [] 1 1;;
val all_reinas : int -> (int * int) list list = <fun>
# all_reinas 0;;
- : (int * int) list list = [[]]
# all_reinas 1;;
- : (int * int) list list = [[(1, 1)]]
# all_reinas 2;;
- : (int * int) list list = []
# all_reinas 4;;
- : (int * int) list list =
[[(4, 3); (3, 1); (2, 4); (1, 2)]; [(4, 2); (3, 4); (2, 1); (1, 3)]]
# all_reinas 7;;
- : (int * int) list list =
[[(7, 6); (6, 4); (5, 2); (4, 7); (3, 5); (2, 3); (1, 1)];
 [(7, 5); (6, 2); (5, 6); (4, 3); (3, 7); (2, 4); (1, 1)];
 [(7, 4); (6, 7); (5, 3); (4, 6); (3, 2); (2, 5); (1, 1)];
 [(7, 3); (6, 5); (5, 7); (4, 2); (3, 4); (2, 6); (1, 1)];
 [(7, 6); (6, 3); (5, 5); (4, 7); (3, 1); (2, 4); (1, 2)];
 [(7, 7); (6, 5); (5, 3); (4, 1); (3, 6); (2, 4); (1, 2)];
 [(7, 6); (6, 3); (5, 7); (4, 4); (3, 1); (2, 5); (1, 2)];
 [(7, 6); (6, 4); (5, 7); (4, 1); (3, 3); (2, 5); (1, 2)];
 [(7, 6); (6, 3); (5, 1); (4, 4); (3, 7); (2, 5); (1, 2)];
 [(7, 5); (6, 1); (5, 4); (4, 7); (3, 3); (2, 6); (1, 2)];
 [(7, 4); (6, 6); (5, 1); (4, 3); (3, 5); (2, 7); (1, 2)];
 [(7, 4); (6, 7); (5, 5); (4, 2); (3, 6); (2, 1); (1, 3)];
 [(7, 5); (6, 7); (5, 2); (4, 4); (3, 6); (2, 1); (1, 3)];
 [(7, 1); (6, 6); (5, 4); (4, 2); ...]; ...]
# List.length (all_reinas 11);;
- : int = 2680
# List.length (all_reinas 12);;
- : int = 14200
# List.length (all_reinas 13);;
- : int = 73712

(*-----------------------------------------------------------------*)

# V;;
Error: Unbound constructor V
# v;;
Error: Unbound value v
# type booleano = V | F;;
type booleano = V | F
# V;;
- : booleano = V
# F;;
- : booleano = F
#  let no ) function
      F -> V | V -> F;;
Error: Syntax error
#  let no = function
      F -> V | V -> F;;
val no : booleano -> booleano = <fun>
# no verdadero;;
Error: Unbound value verdadero
# let verdadero = V;;
val verdadero : booleano = V
# no verdadero;;
- : booleano = F
# let conj x y = match (x,y) with
      (V , V ) -> V
    | _ -> F;;
val conj : booleano -> booleano -> booleano = <fun>
# conj V V;;
- : booleano = V
# conj V F;;
- : booleano = F
# let falso = F;;
val falso : booleano = F
# let conj x y = match (x,y) with
      (verdadero, verdadero) -> verdadero
    | _ -> falso;;
Error: Variable verdadero is bound several times in this matching
# let conj x y = match (x,y) with
      (verdadero, _) -> verdadero
    | _ -> falso;;
Warning 11 [redundant-case]: this match case is unused.

val conj : booleano -> 'a -> booleano = <fun>
# conj V 2;;
- : booleano = V
# conj verdadero falso;;
- : booleano = V
# conj falso 2;;
- : booleano = F
# conj 100+1 falso;;
Error: This expression has type int but an expression was expected of type
         booleano
# conj (100+1) falso;;
Error: This expression has type int but an expression was expected of type
         booleano
# let conj x y = match (x,y) with
      (verdadero, _ ) -> y
    | _ -> falso;;
Warning 11 [redundant-case]: this match case is unused.

val conj : 'a -> booleano -> booleano = <fun>
# let conj x y = match (x,y) with
      (V, _ ) -> y
    | _ -> falso;;
val conj : booleano -> booleano -> booleano = <fun>
# let conj x y = match (x,y) with
      (verdadero, verdadero) -> verdadero
    | _ -> falso;;
Error: Variable verdadero is bound several times in this matching
# let conj x y = match x,y with
      V, V -> V
    | _ -> F;;
val conj : booleano -> booleano -> booleano = <fun>
# let conj = function
      V -> (function z -> z
    | _ -> (function _ -> F);;
Error: Syntax error: ) expected
Line 2, characters 9-10:   This ( might be unmatched
# let conj = function
      V -> (function z -> z)
    | _ -> (function _ -> F);;
val conj : booleano -> booleano -> booleano = <fun>
# let conj x y = match x with
      V -> y
    | _ -> F;;
val conj : booleano -> booleano -> booleano = <fun>
# type numero = I of int | F of float;;
type numero = I of int | F of float
# I 3;;
- : numero = I 3
# F 2.3;;
- : numero = F 2.3
# [I 2; I 3; F 2.5];;
- : numero list = [I 2; I 3; F 2.5]
# let suma x y = match x, y with
      I m, I n -> I (m + n)
    | F x, F y -> F (x +. y)
    | F x, I n -> F (x +. float_of_int n)
    | _ -> suma y x;;
Error: Unbound value suma
Hint: If this is a recursive definition,
you should add the rec keyword on line 1
# let rec suma x y = match x, y with
      I m, I n -> I (m + n)
    | F x, F y -> F (x +. y)
    | F x, I n -> F (x +. float_of_int n)
    | _ -> suma y x;;
val suma : numero -> numero -> numero = <fun>
# suma I 3 F 3;;
Error: The function suma has type numero -> numero -> numero
       It is applied to too many arguments
Line 1, characters 9-10:   This extra argument is not expected.
# suma I 3 F 3.;;
Error: The function suma has type numero -> numero -> numero
       It is applied to too many arguments
Line 1, characters 9-10:   This extra argument is not expected.
# suma (I 3) (F 3.);;
- : numero = F 6.
# suma (I 3) (F 3.0);;
- : numero = F 6.
# let eqnum x y = match x, y with
      I n, F z | F z, I n -> z = float_of_int n
    | _ -> x = y;;
val eqnum : numero -> numero -> bool = <fun>
# type otroint = Otro of int;;
type otroint = Otro of int
# type dobleint = L of int | R of int;;
type dobleint = L of int | R of int
# type nat = Zero | Succ of nat;;
type nat = Zero | Succ of nat
# Succ Zero;;
- : nat = Succ Zero
# Succ (Succ zero);;
Error: Unbound value zero
# Succ (Succ Zero);;
- : nat = Succ (Succ Zero)
# let cero  = Zero;;
val cero : nat = Zero
# ler uno = Succ Zero;;
Error: Unbound value ler
Hint: Did you mean lor or lsr?
# let uno = Succ Zero;;
val uno : nat = Succ Zero
# let dos = Succ uno;;
val dos : nat = Succ (Succ Zero)
# type 'a option = None | Some of 'a;;
type 'a option = None | Some of 'a
# Some 3;;
- : int option = Some 3
# Some "hola";;
- : string option = Some "hola"
# None;;
- : 'a option = None
# Some None;;
- : 'a option option = Some None

(*-----------------------------------------------------------------*)

# type 'a bintree =
      Empty | BT of 'a * 'a bintree * 'a bintree;;
type 'a bintree = Empty | BT of 'a * 'a bintree * 'a bintree
# Empty;;
- : 'a bintree = Empty
# BT (1, Emptyy, Empty);;
Error: This variant expression is expected to have type int bintree
       There is no constructor Emptyy within type bintree
Hint: Did you mean Empty?
# BT (1, Empty, Empty);;
- : int bintree = BT (1, Empty, Empty)
# let t0 BT (0,Empty, Empty);;
Error: Syntax error
# let t0 = BT (0, Empty, Empty);;
val t0 : int bintree = BT (0, Empty, Empty)
# let t0 = BT (1, Empty, Empty);;
val t0 : int bintree = BT (1, Empty, Empty)
# let t0 = BT (0, Empty, Empty);;
val t0 : int bintree = BT (0, Empty, Empty)
# let t1 = BT (1, Empty, Empty);;
val t1 : int bintree = BT (1, Empty, Empty)
# let t = BT (2, t1, t0);;
val t : int bintree = BT (2, BT (1, Empty, Empty), BT (0, Empty, Empty))
# let v = Empty;;
val v : 'a bintree = Empty
# let leaf x = BT (x, v, v);;
val leaf : 'a -> 'a bintree = <fun>
# leaf 0;;
- : int bintree = BT (0, Empty, Empty)
# leaf "hola";;
- : string bintree = BT ("hola", Empty, Empty)
# let tid =
  ;;
Error: Syntax error
# let tid = BT (6, leaf 5, leaf 11);;
val tid : int bintree = BT (6, BT (5, Empty, Empty), BT (11, Empty, Empty))
# let tdd = BT (9, leaf 5, v);;
val tdd : int bintree = BT (9, BT (5, Empty, Empty), Empty)
# let ti = BT (7, leaf 2, tid);;
val ti : int bintree =
  BT (7, BT (2, Empty, Empty),
   BT (6, BT (5, Empty, Empty), BT (11, Empty, Empty)))
# let td =

  BT (9, v, tdd);;
val td : int bintree = BT (9, Empty, BT (9, BT (5, Empty, Empty), Empty))
# let t = BT (1, ti, td);;
val t : int bintree =
  BT (1,
   BT (7, BT (2, Empty, Empty),
    BT (6, BT (5, Empty, Empty), BT (11, Empty, Empty))),
   BT (9, Empty, BT (9, BT (5, Empty, Empty), Empty)))
# let raiz = function

      BT (r,_,_) -> r
    | Empty -> raise (Failure "raiz");;
val raiz : 'a bintree -> 'a = <fun>
# raiz t;;
- : int = 1
# raiz t0;;
- : int = 0
# let rec altura = function
    Em  pty -> 0
  | B  T (_,i, d) -> 1 + max (altura i) (altura d);;
val altura : 'a bintree -> int = <fun>
# altura t;;
- : int = 4
# let rec leaves = function
    Em  pty -> []
  |   BT (_, i, d) -> leaves i @ leaves d;;
val leaves : 'a bintree -> 'b list = <fun>
# leaves t;;
- : 'a list = []
# t;;
- : int bintree =
BT (1,
 BT (7, BT (2, Empty, Empty),
  BT (6, BT (5, Empty, Empty), BT (11, Empty, Empty))),
 BT (9, Empty, BT (9, BT (5, Empty, Empty), Empty)))
# let rec leaves = function
    E  mpty -> []
  |   BT (r, Empty, Empty) -> [r]
  | BT (_(_, i, d) -> leaves i @ leaves d;;
val leaves : 'a bintree -> 'a list = <fun>
# leaves t;;
- : int list = [2; 5; 11; 5]
# type 'a gtree =
    GT of 'a * 'a gtree list;;
type 'a gtree = GT of 'a * 'a gtree list
# let gt0 = GT (1, []);;
val gt0 : int gtree = GT (1, [])
# let gt1 = GT (2, []);;
val gt1 : int gtree = GT (2, [])
# let gt = GT (0, [gt0; gt1; gt0]);;
val gt : int gtree = GT (0, [GT (1, []); GT (2, []); GT (1, [])])
# let gt' = GT (0, [gt0; gt1; gt; gt0]);;
val gt' : int gtree =
  GT (0,
   [GT (1, []); GT (2, []); GT (0, [GT (1, []); GT (2, []); GT (1, [])]);
    GT (1, [])])
# let rec size = function
    Empty -> 0 | BT (_, i, d) -> 1 + size i + size d;;
  val size : 'a bintree -> int = <fun>
# let rec gsize (GT (_, ramas)) =
    List.  fold_left (fun acc r -> acc + gsize r) 1 ramas;;
val gsize : 'a gtree -> int = <fun>
# size t;;
- : int = 9
# gsize gt;;
- : int = 4
