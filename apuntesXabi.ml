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