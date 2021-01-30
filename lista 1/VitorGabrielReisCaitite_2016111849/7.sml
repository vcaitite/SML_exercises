(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 7 - Função split: string -> string list
que recebe uma frase f e retorna uma lista em que
cada elemento é uma palavra de f. Considerou-se 
que cada palavra na frase pode estar separada por 
espaço, ou pelos caracteres ”,”, ”.”, ou ”-”.
++++++++++++++++++++++++++++++++++++++++++++++++ *)
fun split phrase = 
    String.tokens (fn x => if x = #"," orelse x = #" " orelse x = #"." orelse x = #"-" then true else false) phrase;