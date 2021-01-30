(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 12 - Função multiPairs: 
int list * int list -> int list que recebe duas
listas e retorna uma lista contendo o produto
 de cada par de elementos das listas de entrada.
++++++++++++++++++++++++++++++++++++++++++++++++ *)
fun multiPairs (l1, l2) = (ListPair.map (fn (a,b) => a*b) (l1,l2));