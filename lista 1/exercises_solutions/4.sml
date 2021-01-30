(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 4 - Função max: int list -> int que
retorna o maior valor de uma lista.
+++++++++++++++++++++++++++++++++++++++++++++++ *)
fun max ([]) = raise Match
  | max (a::[]) = a
  | max (a::b::c) = 
    if (a>b) then 
        max(a::c)
    else 
        max(b::c);