(*24 SEPTIEMBRE*)

let iszero = function 0 -> true |_ -> false;;
let doble = function x -> 2 * x;;
let always_true = function _ -> true;;        (*el comodin no es necesario*)
let sqr = function x -> x * x;;
(*sqr = 3;;*)
let cuadrado = function x -> x * x;;
let id = function x -> x;;                  (*funcion identidad*)
(*+id = 5;;*)
id 'a';;
id abs;;
let id_int = function (x : int) -> x;;
(*let id_int = int -> int = function x -> x;;*)
(*let id_int = int -> int = <fun>*)
let double = function x -> 2 * x;;
let sqr = function x -> x * x;;
let id x = x;;
let always_true _ = true;;

let abs x = 
	(function true -> x | false -> -x) (x >= 0);;

let f = function true -> 1 | false -> -1
let abs x = f (x > 0) * x 

let abs x = 
	let f = function true -> 1 | false -> -1 in 
	f (x > 9) * x

let abs = 
	let f = function true -> 1 | false -> -1 in 
	function x -> f (x > 0) * x

let l r = 
	let pi = 2. *. asin 1. in 
	2. *. pi +. r
;;

let abs x = 
	if x >= 0 then x else -x

(*if <b> then <e1> else <e2>*)            (*las expresiones tienen que ser del mismo tipo*)	
;;
(*Diferencias entre or y and*)

true || true;;  (*true*)
true || false;;  
true && true;;
true && false;;
true || (2 / 0 > 3);;     (*lo segundo ya no se evalua como pasa con if y else*)

(*b1 || b2*) 
(*if b1 then true else b2*)

(*b1 &&  b2*) 
(*if b1 then b2 else false*)

(2 <> 0) && (5 / 0 = 7);; (*Error porque lo primero es true*)
(2 < 0) && (5 / 0 = 7);; (*devuelve false*)

let f = function x -> function y -> x + y;;    
f 3 5;; (*Devuelve 8*)                        (*Toda funcion matematica solo tiene un parametro*)   


(*30 SEPTIEMBRE*)

let suma = function x -> function y -> x + y;;
suma 3 5;; (*devuelve 8*)

(*en funciones con muchas flechas leemos por la derecha ya que las flechas asocian por la derecha*)

(suma 3) 5;; (*tambien da 8*)

let suma x y = x + y;;
let suma x = function y ->  x + y;;
(*Las tres funciones son equivalentes*)

let incr 3 = suma 3;;
(*incr 3 = 9;;*)
3 + 5;;
(+);; (*int -> int -> int = <fun>*)
(+) 3 5;;

(*tuplas*)

let suma' = function (x,y) -> x + y;;
let (x, y) = (3,5) in x + y;;
let (x, y) = (2 + 1, 7-2);;
let p = (2 + 1, 7 - 2);;
fst;;     	(*funcion que devuelve la primera componente de una tupla*)
snd p;;		(*funcion que devuelve la segunda componente de una tupla*)	
let f (x, x) = x;; (*error*)
let succ = suma 1;;
suma;;
suma';;
suma' 3;;

(*recursividad*)
let rec fact n = if n = 0 then i else n * fact (n -1);;

(*1 OCTUBRE*)
(=);; 
3 = 5;;      (*es lo mismo*)
(=) 3 5;;
let positivo = (<=) 0;;
positivo 0;;
positivo 3;;
let p = ((true, 0), "falso, trio");;
fst p;;
snd p;;
let x, y = p;;
x;;
y;;
let x, y = 0;;
let rec fact n = if n = 0 then 1 else n * fact (n-1);;   (*Dara error porque fact no esta definido*)    (*se soluciona añadiendo "rec"*)
fact 5;;


let rec fact n = 
	if n = 0 then 1
else n * fact (n - 1)
;;

(*
fact 3 = 
3 * fact 2 = 
3 * (2 * fact 1) = 
3 * (2 * (1 * fact 0)) = 
3 * (2 * (1 * 1)) =
3 * (2 * 1) = 
3 * 2 =
6
*)

fact 10;;
fact 20;;
fact 30;;
(*esta funcionando en Z mod 2^63, obedece a la aritmetica de los int tal y como estan implementados en la maquina*)
fact 21;;

(*Sucesion fibonacci*)
let rec fib n = 
	if n <= 1 then n
	else fib (n-1) + fib (n-2)
;;

fib 0;;
fib 10;;
fib 40;;

(*7 OCTUBRE*)

(*producto cartesiano*)

let f x = (x-1, x+1);;
f 3;;
let f (x,y) = (x+y, x*y);;
f (3,5);;
let f x y = (x+y, x+y);;
f 3 5;;

let per_area r = 
	let pi = 2. *. asin 1. in
	function r -> (2. *. pi *. r, pi *. r *. r)
;;

(*funcion que dados dos enteros devuelve el cociente*)
let rec quo x y = 		(*x >= 0, y > 0*)
	if x < y then 0 
	else 1 + quo (x-y) y
;;

(*funcion que dados dos enteros devuelve el resto*)
let rec rem x y= 
	if x < y then x
	else rem (x-y) y
;; 

(*funcion que devuelva el cociente y el resto*)
let div x y = 
	(quo x y, rem x, y)

(*esto sería un cero*)
let rec div x y = 
	if x < y then (0, x)
	else (1 +  fst (div (x-y) y), snd (div (x-y) y))  (*doble recursividad!!!!*)
;;

(*forma correcta*)
let rec div x y = 
	if x < y then (0, x)
	else
		let p = div (x-y) y in 
		(1 + fst p, snd p)
;;

let rec div x y = 
	if x < y then (0, x)
	else 
		let (q, r) = div (x - y) y in
		(1 + q, r)
;;

(*8 OCTUBRE*)

(*Sucesion fibonacci*)
let rec fib n = 
	if n <= 1 then n
	else fib (n-1) + fib (n-2)
;;

(*Funcion para calcular tiempo de ejecucion de una funcion*)
let crono f x = 
	let t = Sys.time () in
	let _ = f x in
	Sys.time () -. t
;;

crono fib 34;;
crono fib 36;;
crono fib 35;;
let k = (1. +. sqrt 5.) /. 2.;;

let rec fib2 = function
	1 -> (1, 0)
  | n -> let (fn1, fn2) = fib2 (n-1) in     
  		 (fn1 + fn2, fn1)
;;

let fib n = 
	fst (fib2 n)
;;

let rec fib2 = function
	0 -> (0, 1)
  | n -> let (fn1, fn2) = fib2 (n-1) in
	fst (fib2, n)
;;

let fib n = 
	let rec aux i fi fa = 
		if i = n then fi
		else aux (i+1)(fi+fa) fi
	in 
	  aux 0 0 1
;;  

(*14 OCTUBRE*)

(*Listas*)
[1; 2; 3; 10];;
[3; 5; 4];;
[9];;
let l = ["a"; "e"; "i"; "o"; "u"];;

List.length;;
List.length l;;
List.hd l;; (*Cabeza de la lista, primer elemento*)
List.tl;; (*Cola de la lista, todo menos la cabeza*)
List.hd [];; (*Cabeza lista vacia, error de ejecucion*)
List.tl [];; (*Cola de lista vacia, error de ejecucion*)

Division_by_zero;;
(*Tipo que da soporte a las excepciones*)

[1; 2; 3] @ [4; 5];; (*Concatenación de listas*)

List.append;; 

(*Definir longitud de la lista*)
let rec length l = 
	if l = [] then 0
	else 1 + List.length (List.tl l)
;;

List.rev;;
List.rev l;;
List.nth;;
List.nth l 0;;
List.nth l 4;;
List.nth l 5;;

List.map abs [1; 2; 3];;
List.map float_of_int [1; 2; 3];;
List.map(( * ) 2) [1; 2; 3];;
List.filter;;
List.filter (function n -> n > 0) [1; 2; 3];;
List.exists;;
List.for_all;;
List.for_all ((<) 0) [1; 2; 3];;
List.find ((<) 0) [-1; -2; -3];;
List.mem 'b' l;; (*si pertenece o no a la lista (member)*)
List.exists ((<) 0) [];;
List.init;; (*Permite crear "de golpe" listas de cualquier tamaño*)
List.init 10 abs;; (*Lista del 0 al 9*)
List.init 1000000 abs;;
let l2 = List.init 1000000 abs;;
List.hd (List.rev l2);;
List.init 26 (function n -> char_of_int (65 + n));;

let sqr n = n * n;;
[(+) 1; abs; sqr];; (*Lista de funciones*)

(*15 OCTUBRE*)

let l = List.init 50_000_000 abs;;
List.length l;;
List.hd (List.rev l);; (*Devuelve el ultimo elemento de la lista*)

(*Funcion para obtener el ultimo elemento de una lista*)
let rec last l = 
	if List.tl l = [] then List.hd		(*preguntamos si es la lista vacia*)
	else last (List.tl l)		(*Llamada recursiva directa, función terminal*)
;;

let rec last l = 
	if List.length l = 1 then List.hd l
	else last (List.tl l)
;;

List.init 26 (function n -> char_of_int (65 + n));; 		(*Lista del abecedario*)

[( * ) 2; abs; (+) 1];;
List.hd ([( * ) 2; abs; (+) 1]);;
(List.hd ([( * ) 2; abs; (+) 1])) 5;;

(*Listas internamente*)
<e1> : t 
<e2> : t list							(*Constructores: 4 puntos y lista vacía*)
...............
<e1> :: <e2> : t list
(*El constructor cuatro puntos asocia por la derecha*)

(*Implementar funcion hd*)
let hd = function h::t -> h;;


(*Lanzamiento de excepciones*)
raise;;		
(*Se puede utilizar en CUALQUIER funcion*)

let hd = function 
[] -> raise (Failure "hd")
| h ::_ -> h 
;;

raise (Failure "hd");;
(*Cuando se evalúa no devuelve nada*)

let tl = function 
	[] -> raise (Failure "tl")
| h::t -> t
;;

let mem x = function 
	[] -> false
 | h::t -> if x = h || mem x t 
;;

List.filter;; 
List.filter ((<) 0) [1; -2; 5];;
List.find ((<) 0) [1; -2; 5];;

let rec find p l = function 
 [] -> raise Not_found 
 | h::t -> if p h then h else find p t 
;;


(*21 OCTUBRE*)
1::2::3::4::[];; (*Define una lista*)

let hd (h::_) = h;;	(*Define la cabeza de la lista*)
let tl (_::t) = t;;	(*Define la cola de la lista*)

list.tl [];;

let hd = function 
 [] -> raise (Failure "hd")
 | h::_ -> h
;;

let tl = function
 [] -> raise (Failure "tl")
 | _::t -> t
;;

lrt tl = function 
_::tl -> tl
| _ -> raise (Failure "tl")		(*Es correcto pero hay que poner el comodin, mejo la otra opcion*)
;;

(*Funcion para obtener el ultimo elemento de ua liasta*)
let rec last l = 
	if List.tl l = [] then List.hd l
	else last (List.tl l)
;;

(*Misma funcion con pattern matching*)
let rec last = function
h::[] -> h
| _::t -> last t
;;
(*Si se pasa la lista vacia da error*)


let rec last = function
[] -> raise (Failure "last")
| h::[] -> h
| _::t -> last l
;;

(*Deffinir longitud de una lista*)
let rec length l = 
	if l = [] then 0
	else 1 + length (List.tl l)
;;

(*Misma funcion con pattern matching*)
list rec length = function
[] -> 0
| _::t -> 1 + length t 
;;
(*Da stack overflow porque las llamadas recursivas en el stack pueden ir acumulando la llamada recursiva anterior hasta saturarlo*)


let rec aux = function
	(n, []) -> n
	| (n, _::t) -> aux (n+1, t)
;;

let length l = 
	let rec aux = function
	 (n, []) -> n
	| (n, _::t) -> aux (n + 1, t)
in 
	aux (0, l)
;;

let rec append = function 
		[] -> (function l -> l)
	| h::t -> (function l -> h :: append t l)
;;

(*22 OCTUBRE*)

(*match with se utiliza para realizar pattern matching*)
match <e> with
	<p1> -> <e1> 
| <p2> -> <e2> 
...
|	<pn> -> <en>

List.compare_lengths;;
list.compare_lengths [1; 2; 3] [''a', 'b'];;
(*Si la primera lista es mas larga devuelve 1, si son de la misma longitud devuelve 0 
y si la segunda lista es mas larga devuelve -1*)

(*implementacion de la funcion*)
let compare_lengths l1 l2 = 
	compare(list.length l1) (List.length l2)
;;
(*Esto no es eficiente -> mejor recorremos las listas*)
let rec compare_lengths = function 
	[] -> (function [] -> 0
							|_ -> -1)
| _::t -> (function [] -> 1
							|_::t2 -> compare_lengths t t2)
;;

(*Implementacion de la funcion con match with*)
let rec compare_lengths l1 l2 = 
	match (l1, l2) with 	(*estudiamos las dos listas a la vez*)
	([], []) -> 0		(*Si las dos son vacias -> 0*)
| ([], _) -> -1		(*Si la primera es vacia -> -1*)
| (_, []) -> 1		(*Si la segunda es vacia -> 1*)
| (_::t1, _::t2) -> compare_lengths l1 l2	(*si no -> comparar las dos listas*)
;;		(*La funcion es terminal, llamada recursiva directa*)

let rec fact = function 
		0 -> 1
	|	n -> n * fact (n-1)
;;

let fact n = 
	let rec aux l acc 
	if i = 0 then acc
	else aux (i-1) (i * acc)
in 
	aux n 1
;;

(*Implementación con pattern matching*)
let fact n = 
	let rec aux acc = function
		0 -> acc
	| i -> aux (i*acc) (i-1)
in 
	aux n 1
;;

let fact n = 
	let rec aux
		if l = n then fi
		else aux (i+1) ((i+1) * fi) 
	in 
		aux 0 1		(*En este caso no podemos usar function*)
;;


(*Funcion fold_left*)
List.fold_left;;	(*recive funcion y lista, trabaja con un acumulador (manual Ocaml)*)
List.map;;	(*Funcion-lista, aplica la funcion a cada elemento de la lista y devuelve las imagenes*)
(+);;		(*Operador suma pasado a funcion purificada*)
List.fold_left (+) 0 [1; 2; 3; 4; 5];; (*devuelve int = 15*)
(*Va sumando los elementos de la lista acumulados en el acumulador (0)*)

List.fold_left (Function acc -> function_ -> acc + 1) 0 l		
(*Dada cualquier lista, la funcion incrementa en una unidad cada elemento de la lista, calcula la longitud de la lista*)

(*Implementacion para la practica: *)
let fold_left f a = function
	[] -> a	(*Si esta vacia devuelve el acumulador*)
|	h::t -> fold_left f (f a h) t	
;;

let rev l = 
	List.fold_left (function acc -> function h -> h::acc) [] l
;;
(*Esta funcion está invirtiendo la lista porque lo que se guarada en el acumulador va a la cabeza de la lista*)
