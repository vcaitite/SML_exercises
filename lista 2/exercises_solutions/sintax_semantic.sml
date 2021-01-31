(* Definindo uma linguagem: *)
datatype expr = IConst of int | Plus of expr * expr | Minus of expr * expr;

val e1 = IConst 17;

(* 

  -
 / \
3  4

*)

val e2 = Minus(IConst 3, IConst 4)

(*

       -
      / \
      +  6
     / \
    23  5

*)

val e3 = Minus(Plus(IConst 23, IConst 5), IConst 6);

(* Interpretar esses programas: *)

fun eval (IConst i) = i
  | eval (Plus(e1, e2)) = (eval e1) + (eval e2)
  | eval (Minus(e1, e2)) = (eval e1) - (eval e2);

eval e1;
eval e2;
eval e3;

(* Evaluating arithmetic expressions with a “cutoff subraction”,
 i.e. one that only produces non-negative results. *)

fun eval2 (IConst i) = i
  | eval2 (Plus(e1, e2)) = (eval2 e1) + (eval2 e2)
  | eval2 (Minus(e1, e2)) = 
    let val result = (eval2 e1) - (eval2 e1) in
        if result < 0 then
            0
        else
            result 
    end;

eval e2;
eval2 e2;


(* Nesse ponto tem-se 2 linguagens:
 L1 = expr + eval
 L2 = expr + eval2 
 
 Apesar de elas compartilharem a mesma sintaxe, elas têm semânticas diferentes *)

(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)

(* Expandindo a linguagem para aceitar também expressões booleanas *)

datatype bexpr = BConst of bool | Not of bexpr | And of bexpr * bexpr | Or of bexpr * bexpr ;

val b1 = BConst false;
val b2 = Not b1;

fun evalb (BConst b) = b
  | evalb (Not b) = not (evalb b)
  | evalb (And (b1, b2)) = (evalb b1) andalso (evalb b2)
  | evalb (Or (b1, b2)) = (evalb b1) orelse (evalb b2);

evalb b1;
evalb b2;

(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
(* Redefinindo a primeira linguagem *)

datatype expr = IConst of int 
    | Plus of expr * expr 
    | Minus of expr * expr 
    | Ite of bexpr * expr * expr;

val e1 = IConst 17;
val e2 = Plus(e1, Minus(IConst 10, IConst 30));
val e3 = Ite(b1, e1, e2);
val e4 = Ite(b2, e1, e2);

fun eval (IConst i) = i
  | eval (Plus(e1, e2)) = (eval e1) + (eval e2)
  | eval (Minus(e1, e2)) = (eval e1) - (eval e2)
  | eval (Ite(c, t, e)) =  if (evalb c) then (eval t) else (eval e);

eval e1;
eval e2;
eval e3;
eval e4;

(* O que foi feito aqui foi uma extensão da primeira linguagem, em 
que agora além de aritmetica tem-se também expressões booleanas  *)

(*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*)
(* Redefinindo novamente a linguagem para aceitar variáveis *)

datatype expr = IConst of int 
    | Plus of expr * expr 
    | Minus of expr * expr 
    | Ite of bexpr * expr * expr
    | Var of string;

val e1 = Var "x";
val e2 = Plus(IConst 17, e1);

(* By building such lists from variable identifiers (strings)  
 to values (IConst i) we will be able to map variables to values
 and thus evaluate expressions with variables. *)

val state = [("x", IConst 3), ("y", IConst 78), ("z", IConst 676)];

(* We define a helper function to look for values in an association list: *)
fun lookup [] id = raise Match
  | lookup ((k:string, v)::t) id = if k = id then v else lookup t id;

lookup state "x";
lookup state "y";
lookup state "w";


(* Evaluation now takes an expression and a state. *)
fun eval (IConst i) _ = i
  | eval (Var x) state = eval (lookup state x) state
  | eval (Plus(e1, e2)) state = (eval e1 state) + (eval e2 state)
  | eval (Minus(e1, e2)) state = (eval e1 state) - (eval e2 state)
  | eval (Ite(c, t, e)) state = if (evalb c) then (eval t state) else (eval e state);


eval e1 state;
eval e2 state;