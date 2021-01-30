(* ++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité -2016111849
Exercise 13 - programa em ML que 
retorna o quadrado da soma de dois 
números inteiros.
+++++++++++++++++++++++++++++++++++++++ *)
fun sum (x,y) = x+y;
fun square x = x*x; 
(*Como o enunciado do exercício define que
a entrada deve ser uma tupla (x,y), então:*)
fun sumSquare (x, y) = square (sum (x, y));  