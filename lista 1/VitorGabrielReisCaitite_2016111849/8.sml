(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 8 - Função allTrue: bool list -> bool 
que recebe uma lista de booleanos e retorna true
apenas se todos os elementos da lista de entrada
 forem verdadeiros.
++++++++++++++++++++++++++++++++++++++++++++++++ *)
fun allTrue [] = true
  | allTrue (a::b) = a andalso allTrue(b); 