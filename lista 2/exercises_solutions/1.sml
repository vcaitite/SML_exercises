(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 1 - Desenvolvimento de uma linguagem com
com os seguintes operadores:
-> Soma (Plus) ⇒ soma dois valores
-> Subtração (Minus) ⇒ subtrai dois valores
-> Multiplicação. (Multi) ⇒ multiplica dois valores.
-> Divisão. (Div) ⇒ divisão inteira de dois valores. Divisão por 0 deve retornar 0.
-> Maior valor. (Max) ⇒ retorna o maior de dois valores.
-> Menor Valor. (Min) ⇒ retorna o menor de dois valores.
-> Igual. (Eq) ⇒ retorna 1 se os valores são iguais, 0 caso contrário.
-> Maior que. (Gt) ⇒ retorna 1 se o primeiro valor é estritamente maior que o
segundo, e 0 caso contrário.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
(* Definindo uma linguagem: *)
datatype expr = IConst of int 
              | Plus of expr * expr 
              | Minus of expr * expr
              | Multi of expr * expr
              | Div of expr * expr
              | Max of expr * expr
              | Min of expr * expr
              | Eq of expr * expr
              | Gt of expr * expr;

(* Função eval : expr -> int, para conseguir avaliar expressões*)
fun eval (IConst i) = i
  | eval (Plus(e1, e2)) = (eval e1) + (eval e2)
  | eval (Minus(e1, e2)) = (eval e1) - (eval e2)
  | eval (Multi(e1, e2)) = (eval e1) * (eval e2)
  | eval (Div(e1, e2)) = if ((eval e2) = 0) then 0 else ((eval e1) div (eval e2))
  | eval (Max(e1, e2)) = if ((eval e1) > (eval e2)) then (eval e1) else (eval e2)
  | eval (Min(e1, e2)) = if ((eval e1) > (eval e2)) then (eval e2) else (eval e1)
  | eval (Eq(e1, e2)) = if ((eval e1) = (eval e2)) then 1 else 0
  | eval (Gt(e1, e2)) = if ((eval e1) > (eval e2)) then 1 else 0;

val e1 = Max(IConst 3, Plus(IConst 2, IConst 3));
val e2 = Div(Multi(IConst 5, IConst 4), Minus(IConst 4, IConst 4));

eval e1;
eval e2;