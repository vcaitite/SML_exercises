(* +++++++++++++++++++++++++++++++++++++++++++++
Developer: Vítor Caitité - 2016111849
Exercise 5 - Função cumSum: int list -> int list 
que recebe uma lista e retorna uma lista 
contendo a soma parcial de seus elementos.
+++++++++++++++++++++++++++++++++++++++++++++++ *)

fun cumSum [] = []
  | cumSum (a::[]) = [a]
  | cumSum (a::b::c) = (a::cumSum(a+b::c)); 