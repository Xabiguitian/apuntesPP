
(*APUNTES PARADIGMAS DE PROGRAMACIÓN CURSO 2024-2025*)


# let x = 9 + 1;;  (*let se usa para definir la x pero la x no es una variable ya que no se puede modificar*)
val x : int = 10


let x = 32 * 32 in x * x * x;;
- : int = 1073741824


#x * x * x;;  
- : int = 1000

# 1 + let x = 32 * 32 in x * x * x;; (*expresion tipo int*)
- : int = 1073741825


# let y = 1 + let x = 32 * 31 in x *  x * x;;(*definimos el valor de y*)
val y : int = 976191489



# function  true -> false | false -> true;;
- : bool -> bool = <fun>


(function true-> false | false -> true) (2 < 3,,)
bool = false

let no = function true - false | false-> true;;
val no : bool ->  bool = <fun>
no (2< 3);;
bool= false

let f = function true -> false;; (*ESTO ES FALSO*)

val f : bool -> bool = <fun>
f (2 < 3);;
bool = false
f 0;;
(*DA ERROR*)
f(2>3);;
(*IMPORTANTE HAY ERRORES DE EJECUCIÓN Y DE COMPILACIÓN*)
val f : bool->bool=<fun>

#f true;;
-: bool=false#f false;;
Exception: Match_failure("//toplevel//", 1, 8).

#let all_ true =function true->true||false->true;;
val all_true :bool->bool=<fun>

#alltrue ('A'<'a');;
-:bool= true

# all_true(2/0>1);;
(*Excepcion: división entre error, porque va a dar 0*)(*ERROR DE EJECUCIÓN NO DE COMPILACIÓN*)

#let all_true = function_ ->true;;
(*El guión de subrayado hace referencia a cualquier tipo, es decir, como para todos los casos.*)
#all_true abs;;
-: bool=true
#all_true int_of_float;;
-: bool=true

#abs abs;;
(*Error: This expression has type int->int but an expression was expected of type int*)

#all true all_true;;
-:bool= true#let all_true =function(_:bool)->true;;
val all_true :bool->bool->>fun>

#all_true 2;;
(*Error: this expression has type int but an expression was expected of type bool*)

# let id =function x->x;;
val id : 'a -> 'a = <fun>

val all_true:bool->bool=<fun>

let is_zero=function 0->true |_->false;;

val is_zero: int ->bool=<fun>

#is_zero 0;;
-: bool=true

#is_zero(-2);;

#let_is_zero=function_->false|0->true;;
(*WArning 11 [redundant-case]:this match case is unused*)
val_is zero: int->bool =<fun>

# let doble =function 0->0|1->2|-1->-2;;
(*Warning 8 [parcial march]: thi pattern matching id not exhaustive.Here is an example of a case thas is not matched:2*)

val doble: int->int=<fun>
val doble : int->int=<fun>

#let doble =function x->2*x;;

#doble (2+1);;
(*Primero se calcula el argumento (el eaguer), es decir, 2+1, y lueo se hace el doble*)
-:int =6

#(function y->2*y)(2+1);;
-:int =6

#(functon y->2*y)2+1;;
-: int = 5
doble(doble 3);;
-: int =12

#(doble doble)3;;
(*Es un error de tipo*)

#let f= function x->2*x
val f: int->int=<fun>

#x;;
(*error, no está definida*)


# let id =function x->x;;
val id : 'a -> 'a = <fun>


#id(id "hola");;
-:string="hola"

#id id "hola";;
-: strting = "hola"

#let x=3;;
val x :int = 3

#let y =10;;
val y : int=10

# let f= function x->x*y;;
val f : int -> int = <fun>


# f(2+1);;
- : int = 2928574467


#f x + f y;;
-:int =130

#let x =18;;
val x : int=18

#x+1;;
-:int =19

f x;;
-: int=180

#f 2;;
-: int=20

#f y;;
-: int =100

#let y =2;;
val y= int =2

#f 2;;
-: int =20
(*podría12
#(doble d dar 4 pero no hemos usado el let para redifinir y entonces nada cambia porque el valor de la variable no cambió.*)

#let y = let_=2+1;;
(*syntax error*)
-:unit=()

#let_ =print_endline "hola";;
hola

-: unit=()

#print_endline;;
-:string->unit=<fun>


# let()=print_endline "hola";;
hola

#let 0=1+1;;


let rec fib n = ( * n >= 1 * )
  if n =< 2 then 1
  else fib (n-1) + fib (n-2);;

  (*22-10-24*)


  (*1-11-24*)

let rec insert x=function
  []->[x]
 |h 11t -> if x < h the x1:h1|t 
      else h :: insert x t;;


let rec isort=function
  []->[]
 |h:: t -> insert h(isort t);;


let crono f x=
  let t=Sys.time() in
  let _ =f x in
  Sys.time()-.t;;




(*FUSIÓN*)
(* merge : 'a list -> 'a list -> 'a list*)
(*'a list * 'a list->'a list*)


let rec merge = function
      ([],l) | (l,[])->l
    | (h1::t1, h2::t2)->if h1<=h2
                        then h1 :: merge (t1, h2::t2)
                        else h2 :: merge (h1:: t1, t2);;



(*FUNCIÓN DIVIDE*)
(*divide: 'a list-> 'a list + 'a list*)

let rec  divide = function
          (h1::h2::t)->let t1, t2=divide t in 
                        (h1:: t1, h2::t2)
        | l -> l, [];;



let rec m_sort l= match l with
    []_::[]->l
    l_ ->let  l1, l2 = divide l in 
    merge (m_sort l1, m_sort l2);;
