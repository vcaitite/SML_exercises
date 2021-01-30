(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 9 - Código que define tipo algébrico de 
dados dinheiro, que possa representar quantidades
em centavos (tipo int), em reais (tipo real), ou 
um par Nome x reais. A partir desse tipo, 
definiu-se uma função amount: dinheiro -> int que 
recebe um tipo dinheiro como entrada e retorna 
a quantidade em centavos correspondente à entrada.
++++++++++++++++++++++++++++++++++++++++++++++++ *)

datatype dinheiro =
    Centavos of int
    | Real of real
    | Pessoa_Dinheiro of string * real;

fun amount (Centavos x) = x
  | amount (Real x) = round(x*100.0)
  | amount (Pessoa_Dinheiro (_, real)) = round(real*100.0);