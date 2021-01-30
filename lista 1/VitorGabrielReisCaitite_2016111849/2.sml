(* ++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité -2016111849
Exercise 2 - Função pow: int*int->int
que recebe um número n e um expoente
e, e retorna o valor de n^e.
+++++++++++++++++++++++++++++++++++++++ *)
fun pow (n, 0) = 1
  | pow (n, e) = n * pow(n,(e-1));