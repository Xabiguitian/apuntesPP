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

(*-----------------------------------------------------------------*)

# type 'a gtree =
      GT of 'a * 'a gtree list;;
type 'a gtree = GT of 'a * 'a gtree list
# let rec size (GT (_, ramas)) =
    List.fold_left (fun acc r -> acc + size r) 1 ramas;;
val size : 'a gtree -> int = <fun>
# let rec size = function
      GT (_, []) -> 1
  | G  T (r, h::t) -> size h + size (GT (r, t));;
val size : 'a gtree -> int = <fun>
# type 'a st_bintree =
      Leaf of 'a
    | SBT of 'a * 'a st_bintree * 'a sst_bintree;;
Error: Unbound type constructor sst_bintree
Hint: Did you mean st_bintree?
# type 'a st_bintree =
    Lea  f of 'a
  | SBT o  f 'a * 'a st_bintree * 'a st_bintree;;
type 'a st_bintree = Leaf of 'a | SBT of 'a * 'a st_bintree * 'a st_bintree
# Leaf 4;;
- : int st_bintree = Leaf 4
# SBT (3, Leaf 21; Leaf 2);;
Error: The constructor SBT expects 3 argument(s),
       but is applied here to 1 argument(s)
# SBT (3, Leaf 21, Leaf 2);;
- : int st_bintree = SBT (3, Leaf 21, Leaf 2)
# type 'a bintree =
      Empty | BT of 'a * 'a bintree * 'a bintree;;
type 'a bintree = Empty | BT of 'a * 'a bintree * 'a bintree










(*------------- PROGRAMACIÓN IMPERATIVA -------------*)

# ref;;
- : 'a -> 'a ref = <fun>
# ref 3;;
- : int ref = {contents = 3}
# ref 'a;;
Error: Syntax error
# ref 'a';;
- : char ref = {contents = 'a'}
# let i = ref 0;;
val i : int ref = {contents = 0}
# i = 0;;
Error: This expression has type int but an expression was expected of type
         int ref
# let c = ref 'a';;
val c : char ref = {contents = 'a'}
# i = c;;
Error: This expression has type char ref
       but an expression was expected of type int ref
       Type char is not compatible with type int
# (!);;
- : 'a ref -> 'a = <fun>
# !i;;
- : int = 0
# !c;;
- : char = 'a'
# !i = 1;;
- : bool = false
# (:=);;
- : 'a ref -> 'a -> unit = <fun>
# ();;
- : unit = ()
# (:=) i 10 ;;
- : unit = ()
# i;;
- : int ref = {contents = 10}
# i := 10;;
- : unit = ()
# i := (!i + 1);;
- : unit = ()
# i;;
- : int ref = {contents = 11}
# let rec fact n =
    if   n <= 0 then 1 else n * fact (n-1);;
val fact : int -> int = <fun>
# (*(while <b> do <e> done): unit*)
(*<e1>;<e2>     let _ = <e1> in <e2>*);;
# let fact n =
      let f = ref 1 in
    let   i = ref 2 in
      while !i <= n do
          f := !f * !i ;
          i:= !i + 1
      done;
    !f  ;;
val fact : int -> int = <fun>

(*-----------------------------------------------------------------*)

# [1; 5; 0];;
- : int list = [1; 5; 0]
# [|1; 5; 0|];;
- : int array = [|1; 5; 0|]
# ([|1; 5; 0|]).(1);;
- : int = 5
# ([|1; 5; 0|]).(3);;
Exception: Invalid_argument "index out of bounds".
# let v = [|1; 5; 0|];;
val v : int array = [|1; 5; 0|]
# Array.get v 0;;
- : int = 1
# open Array;;
# get v o;;
Error: Unbound value o
# get v 0;;
- : int = 1
# set v 1 10;;
- : unit = ()
# v;;
- : int array = [|1; 10; 0|]
# v.(2) <- v.(1) + 1;;
- : unit = ()
# v;;
- : int array = [|1; 10; 11|]
# let z = init 10000 Fun.id;;
val z : int array =
  [|0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20;
    21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38;
    39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52; 53; 54; 55; 56;
    57; 58; 59; 60; 61; 62; 63; 64; 65; 66; 67; 68; 69; 70; 71; 72; 73; 74;
    75; 76; 77; 78; 79; 80; 81; 82; 83; 84; 85; 86; 87; 88; 89; 90; 91; 92;
    93; 94; 95; 96; 97; 98; 99; 100; 101; 102; 103; 104; 105; 106; 107; 108;
    109; 110; 111; 112; 113; 114; 115; 116; 117; 118; 119; 120; 121; 122;
    123; 124; 125; 126; 127; 128; 129; 130; 131; 132; 133; 134; 135; 136;
    137; 138; 139; 140; 141; 142; 143; 144; 145; 146; 147; 148; 149; 150;
    151; 152; 153; 154; 155; 156; 157; 158; 159; 160; 161; 162; 163; 164;
    165; 166; 167; 168; 169; 170; 171; 172; 173; 174; 175; 176; 177; 178;
    179; 180; 181; 182; 183; 184; 185; 186; 187; 188; 189; 190; 191; 192;
    193; 194; 195; 196; 197; 198; 199; 200; 201; 202; 203; 204; 205; 206;
    207; 208; 209; 210; 211; 212; 213; 214; 215; 216; 217; 218; 219; 220;
    221; 222; 223; 224; 225; 226; 227; 228; 229; 230; 231; 232; 233; 234;
    235; 236; 237; 238; 239; 240; 241; 242; 243; 244; 245; 246; 247; 248;
    249; 250; 251; 252; 253; 254; 255; 256; 257; 258; 259; 260; 261; 262;
    263; 264; 265; 266; 267; 268; 269; 270; 271; 272; 273; 274; 275; 276;
    277; 278; 279; 280; 281; 282; 283; 284; 285; 286; 287; 288; 289; 290;
    291; 292; 293; 294; 295; 296; 297; 298; ...|]
# let z = init 10000 (fun _ -> Random.float);;
val z : (float -> float) array =
  [|<fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>;
    <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; <fun>; ...|]
# let z = init 10000 (fun _ -> Random.float 1);;
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean 1.?
# let z = init 10000 (fun _ -> Random.float 1.);;
val z : float array =
  [|0.583887377325693402; 0.767494708182560714; 0.552488271107473561;
    0.676036952504319943; 0.161639864673048472; 0.433461223876926427;
    0.142722841432318615; 0.185692759855454081; 0.616357979144595;
    0.138048181531615355; 0.591107368336474259; 0.140263450090710173;
    0.52832771907851761; 0.447141357802524619; 0.346288142989447323;
    0.183304658911123131; 0.0667512931289781; 0.371699372338353151;
    0.316600590539800275; 0.26548204261035413; 0.0878216645112178673;
    0.889820262687871733; 0.163886958713739372; 0.809261276959300613;
    0.163701988701163148; 0.285093960954827197; 0.159853482936824443;
    0.753952858458033282; 0.718309149819475801; 0.113116488344154331;
    0.27553170263482174; 0.844229063885932329; 0.592961540029684486;
    0.97477104190635766; 0.295713668994903145; 0.374084883719427941;
    0.600675753364167675; 0.478414704678849279; 0.821538029440759154;
    0.19355989020700437; 0.858508699221958271; 0.795477498047505116;
    0.589511083592798; 0.419377280411634801; 0.375691684780297241;
    0.774352501909035373; 0.46765306250146; 0.340319010055176618;
    0.71763374648653433; 0.293362212397440869; 0.952324350916948337;
    0.246938146124386915; 0.322386234089670487; 0.954357700928225583;
    0.0555480079002431681; 0.0500869237042216309; 0.502435709985000756;
    0.414072404268788219; 0.402605910529288513; 0.0615942903785314799;
    0.239009617934112906; 0.737724701361494151; 0.25268710444010023;
    0.479139032528476561; 0.36269281985453794; 0.0117669138332082701;
    0.47249018204672788; 0.842849592388686286; 0.792517888145395366;
    0.976642680274982355; 0.332279065917974736; 0.880969792213285308;
    0.763407588999512887; 0.422126508032960035; 0.0774439430265582152;
    0.140575495090714209; 0.882948364557065934; 0.497130990879533496;
    0.335472779261468; 0.752559619946668645; 0.461597171439911635;
    0.41069447641767; 0.440653891222556715; 0.301650139540027729;
    0.769985301256813; 0.604551278119594637; 0.269114196182754228;
    0.289790671056076032; 0.671535583012770831; 0.646492789941253476;
    0.543850938040019272; 0.800113724444802776; 0.571737380349836455;
    0.574786304759598465; 0.735508966643077078; 0.182666001403737788;
    0.998811601139922622; 0.225977744115000601; 0.507268282342270282;
    0.281763154118379933; 0.509701052376795749; 0.693590196023419869;
    0.624026679869404; 0.30109660846825792; 0.96990516426205664;
    0.450947970313403945; 0.810663415602608461; 0.456586866283819726;
    0.508950324895896311; 0.555808161504622644; 0.171426235839771679;
    0.847543862888556321; 0.847837687766232362; 0.115583267267616585;
    0.939985128624461486; 0.6181217697150172; 0.25835498870077156;
    0.388498060831001912; 0.00325251394358105905; 0.810354352059989;
    0.228877969729227804; 0.138860589897105036; 0.290570222961398894;
    0.417125307630601405; 0.366120689990496628; 0.961437711359044211;
    0.00948665051239250268; 0.73169894283148984; 0.158273543021467233;
    0.00717461282197262573; 0.221533261445932106; 0.590029655870258352;
    0.33444148800112361; 0.487224576039211099; 0.573650932525359;
    0.945903387196603496; 0.285567928145801342; 0.950353685291696171;
    0.667704633324511909; 0.196396464136993409; 0.875755908334037603;
    0.284366023301574566; 0.232500613953716684; 0.201087194637191824;
    0.792939051201129508; 0.794024553271983069; 0.658401248330501732;
    0.881232025434512622; 0.257536914519570392; 0.279504030796202563;
    0.118410601072257315; 0.746346922752155195; 0.688337444063583437;
    0.9104773423033653; 0.754381235593267863; 0.576541883192519644;
    0.892128163734912549; 0.0236592979855682062; 0.144770182311911744;
    0.665683037984639348; 0.945155369786999211; 0.776046237484301127;
    0.58282670273719217; 0.280507395412752825; 0.735710482986884573;
    0.152598500842301199; 0.210439428010680052; 0.278634533774634874;
    0.862740742758240864; 0.34534248104285592; 0.511187286399298668;
    0.396372436562455; 0.869490319153044; 0.155034832245873555;
    0.811899958177191627; 0.637718071533709852; 0.859587459516886199;
    0.850284483411695824; 0.117646997304944212; 0.339454171291738827;
    0.650538493292126652; 0.9508107938457383; 0.444692608061944106;
    0.980475370347352326; 0.755795587800535; 0.937635812820745929;
    0.289771358166780679; 0.651315952236731888; 0.403714342545051119;
    0.121177773225967234; 0.543523726734817858; 0.613792123563736802;
    0.911526516810333698; 0.0455596002799616429; 0.961669525826361893;
    0.303247100055740182; 0.974573867892078893; 0.245347099022293569;
    0.170073255013223568; 0.758422946453711555; 0.132157947586643898;
    0.131196554294551793; 0.598169548214300462; 0.0870918706279955;
    0.368678289844747042; 0.510357332274145925; 0.732112995216655849;
    0.747018386262425893; 0.885265964353153412; 0.925026051816247308;
    0.0485307797272981345; 0.353626506902651738; 0.0659919939656236076;
    0.30023786184889445; 0.763770062343390621; 0.910466861675266803;
    0.777274060115654586; 0.640871599646661849; 0.142954731109156796;
    0.367585904276778175; 0.677138691409809534; 0.620536964011160097;
    0.511947238775166569; 0.729637508892115649; 0.208500174632423207;
    0.584406941106018651; 0.15194824896757142; 0.393450919755321871;
    0.8808421178550494; 0.326590658765718467; 0.935758920041462106;
    0.695555891264372; 0.24033848320123663; 0.509546701302482141;
    0.61112810545884; 0.120845668354271685; 0.113252111137345901;
    0.833392020542140344; 0.649194617949602; 0.746424037932826412;
    0.86713835910337; 0.370467986505079727; 0.47297794821349648;
    0.79503540629163727; 0.672888690658277722; 0.686016241698032214;
    0.987290892873868176; 0.962701499008084216; 0.18637051214043121;
    0.719718854797088303; 0.468703786161199565; 0.445870067442606488;
    0.262658964712442655; 0.55873632129357631; 0.84255071142022564;
    0.108627445104654385; 0.156767017636811556; 0.0805281261133078408;
    0.419645774300862806; 0.867977910671228425; 0.502123086929075146;
    0.367950502280006919; 0.504043593251084832; 0.635161416143904201;
    0.461263904666161073; 0.72316327221292076; 0.124016505693795964;
    0.0192510323657091309; 0.186978242411811491; 0.0156239191192532045;
    0.499321959023379502; 0.34133458198247757; 0.114723147005136528;
    0.358065808563083; 0.55622914602943474; 0.767639734869132506;
    0.347092659426102901; 0.293798012120940144; 0.480588044964275318;
    0.899395656891221917; 0.9797340030547802; 0.704498539786024169;
    0.738131613747288196; 0.118005424193417752; 0.0852578277897290127;
    0.880330505190951; 0.0100773304739889547; 0.854443896381294477;
    0.288233302921741541; 0.223510578345388788; 0.440346305239272762;
    0.694189296796465793; 0.938413041936586367; 0.715448822019853936;
    0.233883469684393552; 0.292179609097548254; 0.133672537859514495;
    0.995428483609512638; 0.653497240791808265; ...|]
# let z = init 100 (fun _ -> Random.init 1000);;
val z : unit array =
  [|(); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); ();
    (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); ();
    (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); ();
    (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); ();
    (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); (); ();
    (); (); (); (); (); (); (); (); (); ()|]
# let z = init 100 (fun _ -> Random.int 1000);;
val z : int array =
  [|857; 718; 262; 78; 114; 576; 542; 301; 251; 691; 86; 625; 580; 568; 699;
    374; 118; 136; 542; 398; 693; 471; 840; 307; 548; 365; 666; 20; 470; 85;
    971; 703; 74; 541; 944; 238; 175; 9; 752; 669; 189; 739; 751; 693; 622;
    819; 740; 176; 55; 476; 850; 935; 388; 357; 223; 531; 474; 181; 644; 51;
    325; 794; 283; 479; 616; 704; 831; 610; 927; 552; 949; 48; 798; 470; 681;
    298; 888; 168; 703; 205; 396; 895; 330; 625; 624; 549; 179; 964; 480;
    277; 484; 74; 20; 255; 109; 64; 690; 960; 787; 943|]
# List.iter (fun v -> print_int v; print_newline ());;
- : int list -> unit = <fun>
# List.iter (fun v -> print_int v; print_newline ()) z;;
Error: This expression has type int array
       but an expression was expected of type int list
# List.iter (fun v -> print_int v; print_newline () z);;
Error: The function print_newline has type unit -> unit
       It is applied to too many arguments
Line 1, characters 48-50:   Hint: Did you forget a ';'?
Line 1, characters 50-51:   This extra argument is not expected.
# for i = 0 to length z do print_int z.(i); print_newline () done;;
857
718
262
78
114
576
542
301
251
691
86
625
580
568
699
374
118
136
542
398
693
471
840
307
548
365
666
20
470
85
971
703
74
541
944
238
175
9
752
669
189
739
751
693
622
819
740
176
55
476
850
935
388
357
223
531
474
181
644
51
325
794
283
479
616
704
831
610
927
552
949
48
798
470
681
298
888
168
703
205
396
895
330
625
624
549
179
964
480
277
484
74
20
255
109
64
690
960
787
943
Exception: Invalid_argument "index out of bounds".
# List.iter (fun v -> print_int v; print_newline () z;;
Error: Syntax error: ) expected
Line 1, characters 10-11:   This ( might be unmatched
# type persona = {nombre: string; edad: int};;
type persona = { nombre : string; edad : int; }
# {edad = 24; nombre = "Maria"}
  ;;
- : persona = {nombre = "Maria"; edad = 24}
# let mery = {edad = 24; nombre = "Maria"};;
val mery : persona = {nombre = "Maria"; edad = 24}
# mery.edad;;
- : int = 24
# let envejece p =
      {nombre = p.nombre; edad = p.edad + 1};;
val envejece : persona -> persona = <fun>
# envejece mary;;�
  envejece mary;;s 15-16:
1 | envejece mary;;�
                   ^
Alert deprecated: ISO-Latin1 characters in identifiers

Alert deprecated: ISO-Latin1 characters in identifiers
  envejece mary;;

Error: Syntax error
# envejece mery;;
- : persona = {nombre = "Maria"; edad = 25}

(*-----------------------------------------------------------------*)

type persona = {nombre: string; edad: int}
let envejece p = 
	{nombre = p.nombre; edad = p.edad + 1};;

let envejece p =
	{p with edad = p.edad + 1};;
	
let envejece = function
	{nombre = n; edad = e} -> {nombre = n; edad = e + 1};;
	
let envejece {nombre = n; edad = e} =
	{nombre = n; edad = e + 1};;
	
let mayor {edad} = edad >= 18;;

type persona' = {nombre: string; mutable edad: int};;

let envejece' p=
  p.edad<-p.edad+1;;

(*alfa refs de ocaml*)
type 'a ref = {mutable contents : 'a};;

let ref x ={contents =x};;

let (!) v=v.contents;;

let (:=) v x=v.contents <- x;;

let  n = ref 0

(*si solo va a tener un caso notación abreviada*)
let next() =
    n := !n +1;
    !n;;

    (*reset de uni para comprobar en termianl sino ejecutaria la definición de la función*)
let reset ()=
  n :=0;;

(*-----------------------------------------------------------------*)

# let n = ref 0;;
val n : int ref = {contents = 0}
# let next () =
      n := !n + 1;
      !n;;
val next : unit -> int = <fun>
# let reset () =
      n := 0;;
val reset : unit -> unit = <fun>
# let next () =
    let n = ref 0 in
    n := !n +1;
    !n;;
val next : unit -> int = <fun>
# next;;
- : unit -> int = <fun>
# next ();;
- : int = 1
# next ();;
- : int = 1
# let next =
    f  unction () ->
          let n = ref 0 in
          n := !n +1;
          !n;;
val next : unit -> int = <fun>
# next ();;
- : int = 1
# next ();;
- : int = 1
# let next =
    l  et n = ref 0 in
    fu  nction () ->
          n := !n + 1;
          !n;;
val next : unit -> int = <fun>
# next ();;
- : int = 1
# next ();;
- : int = 2
# (* ahora si funciona la función next *);;
# let next =
    let n = ref   0 in
    fun  ction () ->
          n := !n + 1;
        !n;;
val next : unit -> int = <fun>
# let n = ref 0 in
    (f(function () -> n := !n + 1; !n),
    (f(function () -> n := 0);;
- : (unit -> int) * (unit -> unit) = (<fun>, <fun>)
# let next, reset =
      let n = ref 0 in
          (function () -> n := !n + 1; !n),
        ( (function () -> n := 0);;
val next : unit -> int = <fun>
val reset : unit -> unit = <fun>
# let counter =
      {next: unit -> int;
       reset: unit -> unit};;
Error: Unbound record field next

(*-----------------------------------------------------------------*)

let doble_next o =
    2 * o#next;;

let doble o = object
    method next = 2 * o#next
    method reset = o#reset
end;;
	
let new_counter () = object
    val mutable n = 0
    method next = n <- n + 1; n
    method reset = n <- 0
end;;

let new_double_counter () = object
    val counter = new_counter ()
    method next = 2 * counter#next
    method reset = counter#reset
end;;

class counter = object
    val mutable n = 0
    method next = n <- n + 1; n
    method reset = n <- 0
end;;

let x = new counter;;

class counter_with_init ini = object
    val mutable n = ini -1
    method next = n <- n + 1; n
    method reset = n <- 0
end;;

class counter_with_init'n'max ini max =
    object (self)
        inherit counter_with_init ini (super)
        method next = if super#next > max then
                         (self#reset; super#next)
                      else self#next
    end;;

(*-----------------------------------------------------------------*)

let k' = (k :> counter);;
(*Si counter es un objeto derivado de k pero con algunas reducciones, k' pasa a ser el objeto k pero con las reducciones de counter*)

class intref = object
    val mutable content
    method get = content
    method set v = content <- v
end;;

(*-----------------------------------------------------------------*)

# class ['a] queue = object (self)
    val mutable fron  t = []
      val mutable back = []
    method push (e: 'a) =
        back <- e::back
    method top = match front, back with
        h::_, _ -> Some h
      |   [],     [] ->   No  ne
        | [], _ -> front <- List.rev back;
                   back <- [];
                   self#top
      method pop = match front, back with
          h::t, _ -> front <- t; Some h
        | [], [] -> None
        | [], _ -> front <- List.rev back;
                   back <- [];
                   self#pop
en  d;;
class ['a] queue :
  object
    val mutable back : 'a list
    val mutable front : 'a list
    method pop : 'a option
    method push : 'a -> unit
    method top : 'a option
  end
# let q = new queue;;
val q : '_weak1 queue = <obj>
# q#top;;
- : '_weak1 option = None
# q#push;;
- : '_weak1 -> unit = <fun>
# q#push "Hola";;
- : unit = ()
# q;;
- : string queue = <obj>
# a#top;;
Error: Unbound value a
# q#top;;
- : string option = Some "Hola"
# q#push "Adios";;
- : unit = ()
# q#top;;
- : string option = Some "Hola"
# q#pop;;
- : string option = Some "Hola"
# q#pop;;
- : string option = Some "Adios"
# q#pop;;
- : string option = None
# let rec pushl l q = match l with
      [] -> ()
  |   h::t -> q#push h; pushl t q;;
val pushl : 'a list -> < push : 'a -> 'b; .. > -> unit = <fun>
# let rec drain q =
    match q#po  p with
          None -> ()
        | _ -> drain q;;
val drain : < pop : 'a option; .. > -> unit = <fun>
# let rec qiter f q =
    matc  h q#pop with
          None -> ()
        | Some e -> f e; qiter f q;;
val qiter : ('a -> 'b) -> < pop : 'a option; .. > -> unit = <fun>
# let q = new queue
  ;;
val q : '_weak2 queue = <obj>
# pushl (List.init 30 Fun.id) q;;
- : unit = ()
# q#top;;
- : int option = Some 0
#
let rec qiter' f q =
    let q = Oo.copy q in
    qiter   f q;;
    val qiter' : ('a -> 'b) -> < pop : 'a option; .. > -> unit = <fun>
#
  qiter' (Printf.printf "%d\n") q;;
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
- : unit = ()
